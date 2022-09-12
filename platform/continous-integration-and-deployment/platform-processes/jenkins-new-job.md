---
title: Create a New Jenkins Job
parent: Platform Processes
grand_parent: Continuous Integration and Deployment
published: true
nav_order: 32703
---

# {{ page.title }}

## Terminology

See [Naming Conventions]({% link platform/naming-conventions.md %}).

## Overview

Jenkins is typically used to check out the code from a linked repository,
but can also run a variety of tests and copy/move build artefacts to other execution environments or repositories.
Email notifications can be sent automatically whenever a job succeeds or fails (to different people in each case, if required).

## Create new job

Click on *New Item*, enter a name and select *Copy existing Item* option
(enter the name of the relevant template in the *Copy from* text box). Finally press *OK* to create the job.

![Jenkins New Item](../images/jenkins-new-item.png)

Names of jobs are governed by rules, so for example build jobs must start with *Build_*.

## Link it to a Source Code Repository

Now click on the newly created job in the Jenkins dashboard, select *Configure* and scroll down to the
*Source Code Management* section. Set up the Repository URL and select the stored Credentials to use.

![Jenkins Job Git Credentials](../images/jenkins-job-git-credentials.png)
