---
title: Jenkinsfile Template
parent: Technical Infrastructure
nav_order: 380
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link technical-infrastructure/naming-conventions.md %}).

## Overview

This shows the general form of a Jenkinsfile used with software build chains.

CESSDA uses Jenkins’ Declarative Pipelines feature to form the logic of the builds.
See <https://jenkins.io/doc/book/pipeline/syntax/> for more information on the syntax of Declarative pipelines.

```groovy
pipeline {

    environment {
        // Define an image tag at the start of the build so it can be consumed by multiple downstream stages
        image_tag = ${env.DOCKER_ARTIFACT_REGISTRY}/app-front:${env.BUILD_NUMBER}
    }

    // For most builds the 'agent any' statement is used to select a 1GB (memory) sized Kubernetes container to build on
    agent any

    // If necessary, the 'agent { label 'himem' }' statement can be used to provision a 5GB (memory) container
    agent {
        label 'himem'
    }

    stages {
        // Stages are used to separate distinct parts of a build (for example building and testing)
        stage('Build') {
            // Agents can also be specified at the stage level. This can be used if a build is run in a Docker container.
            agent {
                docker {
                    image 'build-tools'
                    // "reuseNode true" is specified to ensure that the Docker container runs in the same
                    // Kubernetes pod as the rest of the pipeline
                    reuseNode true
                }
            }
            steps {
                // The exact command to execute here depends on how the application is built
                // For example, JavaScript projects would tend to use "npm run build"
                // However, .Net projects would run "dotnet build"
                sh './build'
            }
        }
        stage('Test') {
            steps {
                // This stage runs automated unit tests as defined by the frameworks used
                // In some cases (such as Maven projects) the tests are run as part of the build, so this stage may not be required
                sh './test'
            }
            post {
                // Post steps are run after a stage has finished; these are typically used to record test results
                always {
                    echo "Recording test results"
                }
                success {
                    echo "====++++Tests executed successfully++++===="
                }
                failure {
                    echo "====++++Tests execution failed++++===="
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                // CESSDA uses Kubernetes which requries Docker images
                // This stage builds the images and sets the image tag to uniquely identify each build
                sh "docker build --tag=${image_tag} ."
            }
        }
        stage('Push Docker Image') {
            steps {
                // Push the built Docker image
                // This is done in a separate stage so that it can be triggered conditionally
                sh "docker push ${image_tag}"
            }
        }
        // The deploy stage calls the deployment job, which is configured elsewhere
        // The image tag is passed to the downstream job
        stage('Deploy') {
            steps {
                echo "Deploying on the CESSDA Cloud Platform"
                build job: 'cessda.deploy.app/main', parameters: [
                    string(name: 'imageTag', value: "${env.BUILD_NUMBER}")
                ], wait: false
            }
        }
    }
    // This post stage runs after the entire build has finished
    post {
        always {
            echo "========always========"
        }
        success {
            echo "========pipeline executed successfully ========"
        }
        // On failure email notifications will typically be set here
        failure {
            send emails
        }
    }
}
```
