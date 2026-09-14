# DevOps CI/CD Project

An end-to-end DevOps implementation project demonstrating automated application build, testing, containerization, deployment, infrastructure provisioning, configuration management, and Kubernetes-based application delivery.

The project integrates GitHub, Jenkins, Maven, JUnit, Docker, Docker Hub, Ansible, Terraform, AWS EC2, and Kubernetes (K3s) into a practical CI/CD workflow.

---

## Project Overview

This project demonstrates how a Java application can move from source code to a running containerized application through an automated DevOps pipeline.

### Workflow

Developer
   ↓
Git / GitHub
   ↓
Jenkins CI/CD
   ↓
Maven Build & JUnit Tests
   ↓
Docker Image Build
   ↓
Docker Hub
   ↓
Kubernetes / K3s
   ↓
AWS EC2
   ↓
Application

Infrastructure and configuration are managed using:

- Terraform
- Ansible
- AWS
- Kubernetes

---

## Architecture

```text
                         ┌─────────────────────┐
                         │      Developer      │
                         │                     │
                         │  Source Code Change │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │       GitHub        │
                         │                     │
                         │  Source Repository  │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │       Jenkins       │
                         │      CI / CD        │
                         └──────────┬──────────┘
                                    │
                  ┌─────────────────┼─────────────────┐
                  │                 │                 │
                  ▼                 ▼                 ▼
             Maven Build       JUnit Tests       Docker Build
                  │                 │                 │
                  └─────────────────┼─────────────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │     Docker Hub      │
                         │  Container Registry │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │    Kubernetes       │
                         │       K3s           │
                         │                     │
                         │   Deployment        │
                         │       +             │
                         │     Service         │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │      AWS EC2        │
                         │                     │
                         │  Running Application │
                         └─────────────────────┘


        Infrastructure Automation
        ──────────────────────────

              Terraform
                 │
                 ▼
            AWS Resources

              Ansible
                 │
                 ▼
        Server ConfigurationTechnology Stack
Category	Technology
Cloud	AWS
Compute	Amazon EC2
Operating System	Ubuntu Linux
Version Control	Git
Repository	GitHub
CI/CD	Jenkins
Build Tool	Apache Maven
Testing	JUnit 5
Application	Java 17
Containerization	Docker
Container Registry	Docker Hub
Orchestration	Kubernetes
Kubernetes Distribution	K3s
Configuration Management	Ansible
Infrastructure as Code	Terraform
Scripting	Bash
Networking	TCP/IP, HTTP, SSH
Deployment	Kubernetes Service / NodePort
Application

The project contains a lightweight Java HTTP application.

The application listens on:

Port: 8081

Application response:

DevOps CI/CD Application is running!

The application is packaged as an executable JAR using Maven.

CI/CD Pipeline

Jenkins automates the application delivery process.

Pipeline Stages
1. Checkout Source Code
        ↓
2. Maven Test
        ↓
3. Maven Package
        ↓
4. Docker Image Build
        ↓
5. Docker Image Push
        ↓
6. Kubernetes Deployment
        ↓
7. Kubernetes Rollout Verification
Jenkins Pipeline

The Jenkins pipeline performs:

Source code checkout from GitHub
Automated JUnit tests
Maven application packaging
Docker image creation
Docker Hub authentication
Docker image push
Kubernetes deployment
Kubernetes rollout verification

Pipeline definition:

Jenkinsfile
Maven Build

Maven is used for:

Dependency management
Compilation
Unit testing
JAR packaging

Example:

mvn -f application/pom.xml test

Build:

mvn -f application/pom.xml clean package

Generated artifact:

application/target/devops-cicd-app-1.0.jar
Testing

JUnit 5 is integrated into the Maven build process.

Tests are executed automatically during the Jenkins pipeline.

This prevents an application from progressing through the pipeline when automated tests fail.

Docker

The application is packaged into a lightweight container using Docker.

Dockerfile
Dockerfile

The container uses:

Eclipse Temurin Java 17 JRE

The application JAR is copied into the container and executed using Java.

Build example:

docker build -t rounak123/devops-cicd-app:1.0 .
Docker Hub

Docker images are stored in Docker Hub.

Repository:

rounak123/devops-cicd-app

Jenkins authenticates with Docker Hub using Jenkins credentials rather than storing credentials directly in the Jenkinsfile.

Kubernetes Deployment

Kubernetes is used to deploy and manage the application container.

The project uses K3s as the lightweight Kubernetes distribution.

Kubernetes Resources
kubernetes/
├── deployment.yaml
└── service.yaml
Deployment

The Deployment manages the application Pod.

Deployment
    ↓
Pod
    ↓
Container
    ↓
Java Application
Service

A Kubernetes NodePort Service exposes the application outside the cluster.

Application port:

8081

NodePort:

30255
Infrastructure as Code

Terraform is used to demonstrate infrastructure automation and AWS resource management.

Terraform configuration includes:

AWS provider
AWS data sources
Variables
Local values
Modules
for_each
Outputs
Resource tagging
Security group configuration

Terraform structure:

terraform/
├── main.tf
├── variables.tf
├── terraform.tfvars.example
├── .terraform.lock.hcl
├── .gitignore
└── modules/
    └── security_group/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
Terraform workflow
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

Terraform state files are intentionally excluded from Git.

Configuration Management

Ansible is used for server configuration and application deployment automation.

Ansible demonstrates:

Inventory management
SSH-based remote execution
Variables
Playbooks
Roles
Handlers
Loops
Docker deployment

Structure:

ansible/
├── inventory
├── playbook.yml
├── docker-deploy.yml
├── vars.yml
└── roles/
    └── nginx/
        ├── tasks/
        │   └── main.yml
        └── handlers/
            └── main.yml
AWS Environment

The project runs on AWS EC2 using Ubuntu Linux.

AWS services/components used include:

Amazon EC2
IAM
Security Groups
EBS
CloudWatch
IAM Roles

AWS IAM roles are preferred over hard-coded long-lived AWS access keys where possible.

Security Practices

Security considerations implemented in the project include:

IAM role-based AWS authentication
SSH key-based EC2 access
Jenkins credential management
Docker registry credentials stored in Jenkins Credentials
Terraform state excluded from Git
.terraform/ excluded from Git
Example Terraform variables provided without secrets
Security groups used for network access control

Sensitive credentials and private keys are never committed to the repository.

Repository Structure
devops-cicd-project/
│
├── application/
│   ├── pom.xml
│   └── src/
│       ├── main/
│       │   └── java/
│       │       └── com/devops/
│       │           └── App.java
│       └── test/
│           └── java/
│               └── com/devops/
│                   └── AppTest.java
│
├── Dockerfile
│
├── Jenkinsfile
│
├── ansible/
│   ├── inventory
│   ├── playbook.yml
│   ├── docker-deploy.yml
│   ├── vars.yml
│   └── roles/
│
├── kubernetes/
│   ├── deployment.yaml
│   └── service.yaml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars.example
│   ├── .terraform.lock.hcl
│   └── modules/
│
└── README.md
End-to-End Deployment Flow
Git Push
   ↓
GitHub Repository
   ↓
Jenkins Pipeline
   ↓
Maven Test
   ↓
Maven Package
   ↓
Docker Build
   ↓
Docker Hub Push
   ↓
Kubernetes Deployment
   ↓
Rollout Verification
   ↓
Running Application
Troubleshooting Covered

The project includes practical troubleshooting experience around:

SSH connectivity
EC2 security groups
Docker permissions
Maven build failures
JUnit test failures
Docker image build errors
Docker Hub authentication
Kubernetes Pod failures
Kubernetes image pull issues
Kubernetes rollout failures
Jenkins credential issues
Jenkins pipeline failures
Terraform validation errors
Terraform authentication
Terraform state management
AWS resource access
Key DevOps Concepts Demonstrated

This project provides practical implementation of:

CI/CD
Infrastructure as Code
Configuration Management
Containerization
Container Registry
Kubernetes Deployment
Automated Testing
Build Automation
Git-based Version Control
Cloud Infrastructure
IAM
Linux Administration
Networking
Deployment Automation
Infrastructure Modularity
Secrets Management
Future Improvements

Planned improvements include:

Dynamic Docker image tagging using Jenkins build numbers
Automated GitHub webhook triggering
Kubernetes rolling deployment improvements
Application health checks
Prometheus and Grafana monitoring
Centralized logging
HTTPS/TLS
Terraform remote state with locking
Kubernetes resource limits and requests
Security hardening
Automated infrastructure testing
Deployment approval gates
Project Outcome

The project demonstrates an end-to-end DevOps workflow where application source code can be transformed into a tested container image and deployed to Kubernetes through an automated Jenkins pipeline.

It combines development, cloud infrastructure, CI/CD, containerization, configuration management, infrastructure as code, and Kubernetes into a single practical implementation.

Author

Rounak Singh

DevOps / Cloud Engineering

Technologies: AWS | Linux | Git | Jenkins | Maven | Docker | Kubernetes | Ansible | Terraform
