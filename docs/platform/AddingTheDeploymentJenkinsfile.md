---
title: Adding the Deployment Jenkinsfile
layout: page
parent: Technical Infrastructure
nav_order: 31x
---

# Adding the Deployment Jenkinsfile

The deployment code is stored in a different repository to the build code. It uses a parametrised Jenkinsfile so an exact version of the
 application can be deployed (for example, a specific version for production). This parameter can be manually specified or specified
 automatically by called jobs.

```groovy
parameters
{
    string(name: 'IMAGE_TAG',
      defaultValue: 'latest',
    description: 'The version of the application to deploy, default is latest if unspecified')
}
```

From this the environment should match the build environment.

There is only one stage in this Jenkinsfile. This stage deploys the application with the image tag specified in the job parameters.

```groovy
stage('Create deployment')
{
    steps
    {
        dir('./infrastructure/gcp/')
        {
            echo 'Run Coffeepot Creation Script'
            echo "Using image tag ${image_tag}"
            sh("bash coffeepot-creation.sh")
        }
    }
}
```

The script coffeepot-deployment.sh substitutes variables from the template yamls and replaces them with the correct values.
 This is done with a series of sed commands to edit the variables.

```bash
sed "s#DEPLOYMENTNAME#$product_name-$module_name#g; s#NAMESPACE#$product_name#g; s#IMAGENAME#$image_tag#g"
 ../k8s/template-coffeepot-deployment.yaml > ../k8s/$product_name-$module_name-deployment.yaml
sed "s/SERVICENAME/$product_name-$module_name/g; s/NAMESPACE/$product_name/g" ../k8s/template-coffeepot-service.yaml >
 ../k8s/$product_name-$module_name-service.yaml
sed "s/NAMESPACE/$product_name/g" ../k8s/template-coffeepot-namespace.yaml >
 ../k8s/$product_name-$module_name-namespace.yaml
```

Note that the first sed has a # character as the delimiter instead of a /. This is because the substitution contains / characters which

 would break sed if a different character was not used.

This is applied to a series of template yamls for the deployment and the service for the application. Examples are shown below:

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: NAMESPACE
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: DEPLOYMENTNAME
  namespace: NAMESPACE
  labels:
    app: DEPLOYMENTNAME
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: DEPLOYMENTNAME
    spec:
      containers:
        - name: DEPLOYMENTNAME
          image: IMAGENAME
          ports:
            - containerPort: 1337
          resources:
            limits:
              memory: "256Mi"
  selector:
    matchLabels:
      app: DEPLOYMENTNAME
```

```yaml
apiVersion: v1
kind: Service
metadata:
  name: SERVICENAME
  namespace: NAMESPACE
spec:
  selector:
    app: SERVICENAME
  ports:
  - port: 1337
    targetPort: 1337
```

The generated yamls are deployed with kubectl apply:

```bash
# Create deployment
kubectl apply -f ../k8s/$product_name-$module_name-deployment.yaml

# Service
kubectl apply -f ../k8s/$product_name-$module_name-service.yaml
```

Kubectl apply will apply any configuration changes made to the deployment manifests and update the image used in the deployment.
 Kubernetes will then roll out the new version of the application in a way that minimises downtime.
