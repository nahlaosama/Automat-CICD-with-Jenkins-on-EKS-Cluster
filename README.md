# Automated CI/CD using Jenkins and EKS Cluster

This project provides a complete setup for automating Continuous Integration and Continuous Deployment (CI/CD) processes
 using Jenkins integrated with Amazon Elastic Kubernetes Service (EKS) clusters. 
 The goal is to streamline application deployment, improve collaboration among teams, and enhance productivity.



## Installation

To set up the automated CI/CD pipeline, follow these steps:

1. **Prerequisites**
   - install tools:

     - [Terraform](https://www.terraform.io/downloads.html)
     - [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
     - [AWS CLI](https://aws.amazon.com/cli/)
     - [kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
     
     

2. **Clone the Repository**
   ```bash
   git clone https://github.com/nahlaosama/Automate-CICD-with-Jenkins-on-EKS-Cluster.git

3. **AWS Configure**

4. **Deploy AWS Infrastructure using Terraform**
   - cd terraform-Infra
   - terraform init
   - terraform plan
   - terraform apply

5. **deploy Jenkins to ec2**
   - cd ansible-jenkins-setup
   - ansible-playbook -i inventory jenkins.yml

6. **Prepare GitHub Repository**
   - Create two branches: Dev and Prod.
   - Add the Dockerfile to containerize my web project.
   - Add Kubernetes deployment files
   - Add Jenkinsfile
   - Create webhook

7. **Kubernetes Configuration**
   - Access eks Cluster
   - Create two namespaces: Dev and Prod.
   

**To utilize the CI/CD pipeline, follow these steps:**

  1. **Prerequisites**
  - connect to ec2(jenkins server)
  - install aws CLI
  - install kubectl

  2. **Access Jenkins**
   - navigate to http://<EC2_INSTANCE_IP>:8080
   - install docker and Kubernetes plugin
   - add needed credentials
   - Create new pipeline
   - add Jenkinsfile repo URL 
   - add branches
   - trigger pipeline by using webhook


