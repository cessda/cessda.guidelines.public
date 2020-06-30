---
title: Jenkinsfile Template for JDK11 Maven Projects
parent: Technical Infrastructure
nav_order: 318
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Overview

This shows the general form of a Jenkinsfile used with a Maven project based on JDK11.

```groovy
pipeline {
    environment {
        product_name = "product"
        module_name = "module"
        image_tag = "${docker_repo}/${product_name}-${module_name}:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    }

    agent any

    stages {
        stage('Check environment') {
            steps {
                echo "Check environment"
                echo "product_name = ${product_name}"
                echo "module_name = ${module_name}"
                echo "image_tag = ${image_tag}"
            }
        }
        stage('Build Project') {
            agent {
                docker {
                    image 'maven:3-jdk-11'
                    reuseNode true
                }
            }
            steps {
                withMaven {
                    sh 'export PATH=$MVN_CMD_DIR:$PATH && mvn clean install'
                }
            }
        }
        stage('Run Sonar Scan') {
            agent {
                docker {
                    image 'maven:3-jdk-11'
                    reuseNode true
                }
            }
            steps {
                withSonarQubeEnv('cessda-sonar') {
                    withMaven {
                        sh 'export PATH=$MVN_CMD_DIR:$PATH && mvn sonar:sonar'
                    }
                }
            }
        }
        stage("Get Sonar Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                sh 'gcloud auth configure-docker'
                //If the Maven project has the Docker plugin use this
                withMaven {
                    sh 'mvn docker:build docker:push'
                }
                //Otherwise use this in the context of the Dockerfile directory
                sh("docker build -t ${image_tag} .")
                sh("docker push ${image_tag}")
                sh("gcloud container images add-tag ${image_tag} ${docker_repo}/${product_name}-${module_name}:${env.BRANCH_NAME}-latest")
            }
        }
        stage('Check Requirements and Deployments') {
            steps {
                dir('./infrastructure/gcp/') {
                    build job: 'cessda.product.deploy/master',
                        parameters: [string(name: 'module_image_tag',
                        value: "${image_tag}"),
                        string(name: 'module', value: 'module')],
                        wait: false
                }
            }
        }
    }
}
```
