---
title: Jenkinsfile Template
parent: Technical Infrastructure
nav_order: 317
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/NamingConventions.md %}).

## Overview

This shows the general form of a Jenkinsfile used with non-Maven projects.

```groovy
// CESSDA uses Jenkins’ Declarative Pipelines feature to form the logic of the builds
// See https://jenkins.io/doc/book/pipeline/syntax/ for more information on the syntax of Declarative pipelines
pipeline{

    // Typically, when defining an agent, the agent any syntax is used to select a 1GB (memory) sized Kubernetes container to build on
    agent any

    // If necessary, the agent label 'himem' can be selected for a 2.5GB container if the build requires more memory
    agent{
        label 'himem'
    }


    stages{
        // Stages are used to separate distinct parts of a build (for example building and testing)
        stage('Build'){
            // Agents can also be specified at the stage level. This can be used if a build is run in a Docker container.
            agent{
                docker{
                    image 'build-tools'
                    // reuseNode true is specified to ensure the workspace is copied into the docker container
                    reuseNode true
                }
            }
            steps{
                sh './build'
            }
        }
        stage('Test'){
            steps{
                sh './test'
            }
            post{
                // Post steps are run after a stage has finished; these are typically used to record test results
                always{
                    echo "Recording test results"
                }
                success{
                    echo "====++++Tests executed successfully++++===="
                }
                failure{
                    echo "====++++Tests execution failed++++===="
                }

            }
        }
        // The deploy stage calls the deployment job, which is configured elsewhere
        stage('Deploy'){
            steps{
                echo "Deploying on the CESSDA Cloud Platform"
                build job 'cessda.deploy.app'
            }
        }
    }
    // This post stage runs after the entire build has completed
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        // On failure email notifications will typically be set here
        failure{
            send emails
        }
    }
}
```

