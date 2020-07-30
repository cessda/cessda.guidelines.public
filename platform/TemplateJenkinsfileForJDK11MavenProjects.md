---
title: Jenkinsfile Template for JDK11 Maven Projects
parent: Technical Infrastructure
nav_order: 385
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Overview

This shows the general form of a Jenkinsfile used with a Maven project based on JDK11.

The first step is to set a log rotation policy and specify the maximum number of builds to keep.

```groovy
pipeline{
    options {
        buildDiscarder logRotator(artifactNumToKeepStr: '5', numToKeepStr: '20')
    }
}
```

Define the environment variables and include the generic image tagging statement

```groovy
    environment {
        product_name = "product"
        module_name = "module"
        image_tag = "${docker_repo}/${product_name}-${module_name}:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    }
```

Specify the Jenkins agent to use to perform the build

```groovy
    agent {
         label 'jnlp-himem'
    }
```

Steps for building a deployable image (from main branch)

```groovy
stages {
    stage('Pull SDK Docker Image') {
        agent {
            docker {
                    image 'openjdk:11-jdk'
                    reuseNode true
                }
            }
            stages {
                stage('Build Project') {
                    steps {
                        withMaven {
                            sh "./mvnw clean install -DbuildNumber=${env.BUILD_NUMBER}"
                        }
                    }
                    when { branch 'master' }
                }
```

Building from minor branches (for pull requests and integration branches)

```groovy
                stage('Test Project') {
                    steps {
                        withMaven {
                            sh './mvnw clean verify'
                        }
                    }
                    when { not { branch 'master' } }
                }
                stage('Record Issues') {
                    steps {
                        recordIssues aggregatingResults: true, tools: [errorProne(), java()]
                    }
                }
```

Run Sonar scan asnd faiul the build if the Quality Gate is not passed

```groovy
              stage('Run Sonar Scan') {
                    steps {
                        withSonarQubeEnv('cessda-sonar') {
                            withMaven {
                                sh "./mvnw sonar:sonar -DbuildNumber=${env.BUILD_NUMBER}"
                            }
                        }
                        timeout(time: 1, unit: 'HOURS') {
                            waitForQualityGate abortPipeline: true
                            }
                    }
                    when { branch 'master' }
                }
            }
        }
```

Build the Docker image, tag it and push it to the image registry

```groovy
        stage('Build and Push Docker image') {
            steps {
                sh 'gcloud auth configure-docker'
                withMaven {
                    sh "./mvnw jib:build -Dimage=${image_tag}"
                }
                sh "gcloud container images add-tag ${image_tag} ${docker_repo}/${product_name}-${module_name}:${env.BRANCH_NAME}-latest"
            }
            when { branch 'master' }
            }
        stage('Check Requirements and Deployments') {
            steps {
                dir('./infrastructure/gcp/') {
                    build job: 'cessda.cdc.deploy/master', parameters: [string(name: 'osmh_indexer_image_tag',
                    value: "${env.BRANCH_NAME}-${env.BUILD_NUMBER}")], wait: false
                    }
                }
            when { branch 'master' }
            }
```

Run the static analysis scan, fail the build if the scan reports any critical security vulnerabilities and save the results

```groovy
      stage('ShiftLeft Scan') {
            agent {
                docker {
                    image 'shiftleft/sast-scan'
                    reuseNode true
                }
            }
            steps {
                // The desired build result is UNSTABLE, not FAILURE
                catchError(buildResult: 'UNSTABLE') {
                    sh 'scan'
                }
            }
             post {
                always {
                    archiveArtifacts 'reports/*'
                }
            }
        }
    }
}
```
