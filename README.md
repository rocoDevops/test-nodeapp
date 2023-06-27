# test-nodeapp
Project_Related_Screenshot => It consists all the screenshots related to our project. Whatever the important task has been performed for that screenshot is available.

nodeapp => It consists Dockerfile i wrote for the Node app added all dependencies , server.js and package.json file.

Inventory => It consists of Private Ip of Jenkins Host and APP Host Machine with ansible user and private key file.

Jenkinsfile => It consists of two stages one stage having one step to git checkout the repository containing the docker file and the application code and another stage to build a docker image of the node application and then publish the image to the ECR repository created.

Provider.tf => It consists Aws resource details, s3 backend and region. Havent used lock mechanism using DynamoDB

Security+Bastion.tf => It is having the SG configuration for Bastion host  and AWS Instance for Bastion creation using Terraform module. 

Security+JenkinsHost+AppHost.tf => It is having the SG configuration for Jenkins and App Host  and AWS Instance for Jenkins and App Host using Terraform module.

Javaplaybook.yml => With the help of this playboock installed Java default-jre in App Host machine it will work as worker for jenkins Host Machine.

Playbook.yml => Written this playbook to install Docker to my Remote Machine Jenkis and App Host. Ansible has been installed to to Bastion host. 

Vpc.tf => It is having Terraform Script to create VPC having two AZ , four subnets 2 private and 2 public. Terraform Module to create NAT Gateway, IGW and Route table.
