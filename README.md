# Introduction

This document provides information concerning the infrastructure as a code set for QaceTech Assessment on the Amazon AWS platform

# Compute Setup
This section give you a guide on how to setup a compute instance that will be used to manage the infrastructure

If you don't have an SSH key already, generate a new SSH key and associate with the Bitbucket account
```bash
ssh-keygen -t rsa -b 4096 && \
cat ~/.ssh/id_rsa.pub
```

```bash
mkdir $HOME/project && \
	cd $HOME/project/qacetech-assessment/infra-code && \
	git clone git@github.com:triplemcoder14/qacetech-assessment.git

```

# Environment Setup
# Prerequisite

This documentation makes references and uses code available for the provided Sinatra App and infra code written by the appliacant. project root would refer to the directory
```
<repo_root>/infra-code/main.ft
```
  

# Setup
To get started, there are certain prerequist that needs to be completed. The requirements are dividend into two

- One-time Setup
- Individual User Setup

### One-Time Setup
The one time setup contains actions that must be executed just once. And these actions are to be carried out on the AWS account where this infrastructure will be deployed into.


#### Install Terraform on your Laptop and Configure AWS CLI

#### Terraform Backend Setup
As Dev-Ops engineers interact with Terraform scripts to deploy and update infrastructure, terraform keeps a state of each execution which enables terraform know what was done at each time, what was updated, what was created etc. With this, terraform can easily execute a rollback on created or update infrastructure. 
A problem arise therefore when there are now multiple users making changes to the terraform infrastructure. Each state will reside locally on the user's machine. With this, if user A makes a change and execute that code on his system, should user B want to rollback that change on his own system, terraform will not be able to, because the state for the change made by user A resides in user A's laptop.

**Note** Terraform manages infrastructure state using what it calls a Backend

To help solve this problem, Terraform can use a **remote backend**. With a remote backend, the state of each user's infrastructure changes do not reside on the user's system, but on a central remote service. One of this remote backend system on Terraform is **AWS S3**

So here we will have to configure and AWS S3 account that will be used by Terraform to manage state, as well as an AWS DynamoDB that will be used for Locking. 

**Note** Locking is important because it prevents two users from updating the state of an infrastructure at the same time

#### Create your S3 Bucket
---

- Visit the AWS S3 console to create an S3 bucket for terraform state management. We recommend creating a new bucket instead of using an already existing one
- Your bucket should have the following attributes
	- Disable Bucket ACL. It's advisable to not use ACL but to instead have it disabled, thus making the Bucket Creator the owner of objects created on the bucket
	- Ensure the created bucket is Private (block all public access to the bucket)
	- Enable Bucket Versioning
	- And finally enable server-side encryption for the bucket
- Note that any DevOps user who is going to use the Terraform infrastructure would have to be given the necessary Permission to access the bucket. The S3 policy need for terraform to work are
	- s3:ListBucket
	- s3:GetObject
	- s3:PutObject
	- s3:DeleteObject
#### Create your DynamoDB Table
---
- In your AWS management console, navigate to the DynamoDB service click on Create Table
- Provide a name for your new table (name will be used later on)
- Your table should have partition key  called **LockID** and should be of type **String**. Terraform requires that your Table has a partition key with the name "LockID" and of type String.
#### Updating the backend configuration
---
On your project root, update the file `backend.tf` and change the value of *bucket* and *dynamodb_table* with the bucket name and dynamodb table that was created above and issue the following command from your project root
```bash
$ terraform init
```


#### Provision the Infrastructure

```
     $ cd /home/ubuntu/project/qacetech-assessment/infra-code
```
And run  

```
    $ terraform plan 
```

```
    $ terraform apply
```

This terraform code is designed to provision an Ec2-Instance that provides the environment for the sinatra app to be deployed.
Terraform would leverage the script ``ec2-user-data.sh`` located at /project/qacetech-assessment/infra/script to install all the required packages for the environment to be ready.


#### CI/CD Set up (Action Runner (Self Hosted) after the the terraform script has finish and ec2-instance has been set up

- To Install GitHub Runner on the EC2 Instance run a script located at qacetech-assessment/infra-code/script/provisioner.sh

- Run the configuration script and follow the prompts.

 ``$ ./config.sh --url https://github.com/your-usernamam/qacetech-assessment --token YOUR-PERSONAL-ACCESS-TOKEN
``

Replace your-username with your GitHub username.

To get a token, On GitHub, navigate to “Settings” > “Actions” > “Runners” and click on “Add self-hosted runner”.

- Start the Self-Hosted Runner Service

  ``
  ./actions-runner/run.sh &
``
-  Verify and Monitor the Runner


## Project Requirement

#### Add Delay to Sinatra App Startup

- I added the ./lib directory to Ruby's load path, so it can require 'cats' (which is presumably defined in lib/cats.rb). The sinatra app will be loaded with the ```cat``` module
- Its reads two environment variables: STARTUP_DELAY_MIN and STARTUP_DELAY_MAX, defaulting to 1 and 5 seconds respectively.

```
max_delay = ENV.fetch('STARTUP_DELAY_MAX', '5').to_i
min_delay = ENV.fetch('STARTUP_DELAY_MIN', '1').to_i
sleep(rand(min_delay..max_delay))
```

- the config is located at ``qacetech-assessment/sinatra-app/config.ru``



## Beyond codes...

![Screenshot 2025-04-11 040120](https://github.com/user-attachments/assets/427fa7d8-c527-41a2-a8aa-8d4fb13c1e84)
![Screenshot 2025-04-11 034804](https://github.com/user-attachments/assets/76456487-bb01-4f1c-9a8e-924870abcacb)
![Screenshot 2025-04-11 034253](https://github.com/user-attachments/assets/750f26ad-097b-422e-af3f-f81cacf7a85d)


