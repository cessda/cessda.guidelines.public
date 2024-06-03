/*
	Copyright CESSDA ERIC 2017-2019

	Licensed under the Apache License, Version 2.0 (the "License"); you may not
	use this file except in compliance with the License.
	You may obtain a copy of the License at
	https://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/
pipeline {

	options {
		buildDiscarder logRotator(numToKeepStr: '20', artifactNumToKeepStr: '5')
	}

	environment {
		productName = 'guidelines'
		componentName = 'public'
		imageTag = "${DOCKER_ARTIFACT_REGISTRY}/${productName}-${componentName}:${GIT_COMMIT}"
		scannerHome = tool 'sonar-scanner'
	}

	agent any

	stages {
		// Compiles documentation
		stage('Lint Markdown') {
			agent {
				dockerfile {
					filename 'jekyll.Dockerfile'
					reuseNode true
				}
			}
			steps {
				sh 'bundle exec mdl --git-recurse .'
			}
		}
		stage('Build Documentation') {
			agent {
				dockerfile {
					filename 'jekyll.Dockerfile'
					reuseNode true
				}
			}
			environment {
				JEKYLL_ENV = "${GIT_COMMIT}"
			}
			steps {
				sh 'jekyll build'
			}
		}
		stage('Proof HTML') {
			agent {
				dockerfile {
					filename 'jekyll.Dockerfile'
					reuseNode true
				}
			}
			steps {
				sh 'bundle exec rake htmlproofer'
			}
			post {
				success {
					archiveArtifacts '_site/**/*'
				}
			}
		}
		stage('Run SonarQube Scan') {
			steps{
				withSonarQubeEnv('cessda-sonar') {
					nodejs('node-18') {
						sh "${scannerHome}/bin/sonar-scanner"
					}
				}
				timeout(time: 1, unit: 'HOURS') {
					waitForQualityGate abortPipeline: true
				}
			}
			when { branch 'main' }
		}
		stage('Build Nginx Container') {
			steps {
				sh "docker build -t ${imageTag} -f nginx.Dockerfile ."
			}
		}
		stage('Push Docker Container') {
			steps {
				sh "gcloud auth configure-docker ${ARTIFACT_REGISTRY_HOST}"
				sh "docker push ${imageTag}"
				sh "gcloud artifacts docker tags add ${imageTag} ${DOCKER_ARTIFACT_REGISTRY}/${productName}-${componentName}:latest"
			}
			when { branch 'main' }
		}
		stage('Deploy Guidelines') {
			steps {
				build job: 'cessda.guidelines.deploy/main', parameters: [string(name: 'imageTag', value: "${GIT_COMMIT}")], wait: false
			}
			when { branch 'main' }
		}
	}
}
