# The CESSDA Branching Model for Deployments

* Deployments in CESSDA are deployed from dedicated repositories
* Deployments use Helm
* A single branch model is used
  * This allows changes to be made to integration branches
  * This prevents surprising behaviours due to a condition that only exists in one branch

## Handling Multiple Environments

* Some settings are per-environment (i.e. what cluster to deploy to, the IP address of databases, etc.)
* Jenkinsfiles use Groovy as the programming language
* Declarative pipelines don't offer much flexibility (this is a good thing)
* Full syntax can be used in a `script {}` block
  * This isolates code that is dynamic and makes it findable
* Example:

```groovy
stage('Deploy Application') {
    steps {
        script {
            def mysqlAddress
            if (cluster == 'staging-cluster') {
                mysqlAddress = "staging-database.mysql"
            } else {
                mysqlAddress = "development-database.mysql"
            }
            // Rest of the deployment process
        }
    }
}
```

## Branching Model

* The branching model is shared with CESSDA applications
* `master` is the integration branch, where all changes are deployed from
* Other branches are merged into `master` when the changes are integrated
* Only master is deployed

![Branching Model Diagram](/images/branch-diagram.svg)
