# DevOps CI/CD Platform

> End-to-end DevOps implementation project covering source control, CI/CD, automated testing, containerization, Kubernetes deployment, Infrastructure as Code, configuration management, AWS infrastructure, security, and operational troubleshooting.

---

## 📌 Project Summary

This project implements a complete application delivery workflow for a Java-based web application.

The objective is to demonstrate how a DevOps engineer can take application source code from a Git repository, automatically test and package it, build and publish a container image, and deploy the application to Kubernetes running on AWS EC2.

### Core Delivery Flow

```text
Developer
    │
    ▼
GitHub
    │
    ▼
Jenkins CI/CD
    │
    ├── Maven Build
    ├── JUnit Tests
    └── Application Packaging
            │
            ▼
       Docker Build
            │
            ▼
        Docker Hub
            │
            ▼
     Kubernetes / K3s
            │
            ▼
         AWS EC2
            │
            ▼
    Running ApplicationTerraform → AWS Infrastructure
Ansible   → Server Configuration
🏗️ Architecture
High-Level Architecture
                         ┌──────────────────────┐
                         │      Developer       │
                         │                      │
                         │   Code / Git Push    │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       GitHub         │
                         │                      │
                         │ Source Repository    │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       Jenkins        │
                         │      CI / CD         │
                         └──────────┬───────────┘
                                    │
             ┌──────────────────────┼──────────────────────┐
             │                      │                      │
             ▼                      ▼                      ▼
       Maven Build            JUnit Tests           Docker Build
             │                      │                      │
             └──────────────────────┼──────────────────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │      Docker Hub      │
                         │  Container Registry  │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │   Kubernetes / K3s   │
                         │                      │
                         │ Deployment           │
                         │ Service              │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       AWS EC2        │
                         │                      │
                         │ Java Application     │
                         └──────────────────────┘
🔄 Infrastructure Automation
                    Infrastructure Layer
                           │
              ┌────────────┴────────────┐
              │                         │
              ▼                         ▼
          Terraform                  Ansible
              │                         │
              ▼                         ▼
        AWS Resources            Server Configuration
Terraform responsibilities
Infrastructure as Code
AWS provider configuration
Data sources
Variables
Locals
Modules
for_each
Outputs
Resource tagging
Security group configuration
Ansible responsibilities
Server configuration
Remote administration
Package installation
Docker configuration
Playbooks
Roles
Handlers
Variables
Deployment automation
🧰 Technology Stack
Area	Technology
Cloud	AWS
Compute	Amazon EC2
OS	Ubuntu Linux
Version Control	Git
Repository	GitHub
CI/CD	Jenkins
Application	Java 17
Build	Apache Maven
Testing	JUnit 5
Containerization	Docker
Registry	Docker Hub
Orchestration	Kubernetes
Kubernetes Distribution	K3s
IaC	Terraform
Configuration Management	Ansible
Scripting	Bash
Networking	TCP/IP, HTTP, SSH
Deployment	Kubernetes NodePort
📁 Repository Structure
devops-cicd-project/
│
├── application/
│   ├── pom.xml
│   └── src/
│       ├── main/
│       │   └── java/
│       │       └── com/devops/
│       │           └── App.java
│       │
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
│       └── nginx/
│           ├── tasks/
│           │   └── main.yml
│           └── handlers/
│               └── main.yml
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
│   ├── .gitignore
│   └── modules/
│       └── security_group/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
│
└── README.md
☕ Application

The project contains a lightweight Java HTTP application.

Runtime
Java Version : 17
Application  : Java HTTP Server
Port         : 8081
Packaging    : Executable JAR
Application Response
DevOps CI/CD Application is running!

The application is intentionally lightweight so the complete DevOps lifecycle can run on a small AWS environment.

🧪 Build & Test Strategy

Maven manages:

Dependency management
Compilation
Unit testing
Packaging
Test
mvn -f application/pom.xml test
Package
mvn -f application/pom.xml clean package
Build Artifact
application/target/devops-cicd-app-1.0.jar
Quality Gate

The Jenkins pipeline executes automated tests before the application proceeds to packaging and containerization.

This creates the following control:

Code
 │
 ▼
Test
 │
 ├── FAIL → Pipeline stops
 │
 └── PASS
       │
       ▼
     Package
🔁 CI/CD Pipeline

Jenkins provides the continuous integration and deployment workflow.

Pipeline Stages
┌─────────────────────────────┐
│ 1. Checkout Source          │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│ 2. Maven Test               │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│ 3. Maven Package            │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│ 4. Docker Build             │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│ 5. Docker Push              │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│ 6. Kubernetes Deployment    │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│ 7. Rollout Verification     │
└─────────────────────────────┘
🧩 Jenkins Implementation

Pipeline definition:

Jenkinsfile

The Jenkins pipeline performs:

GitHub source checkout
Maven unit testing
Maven packaging
Docker image build
Docker Hub authentication
Docker image push
Kubernetes deployment
Kubernetes rollout verification
Pipeline Principle
Fail Fast
    ↓
Test
    ↓
Build
    ↓
Package
    ↓
Containerize
    ↓
Deploy
    ↓
Verify
🐳 Containerization

Docker packages the application and its runtime into a portable container.

Base Runtime
Eclipse Temurin Java 17 JRE
Image
rounak123/devops-cicd-app:1.0
Build
docker build -t rounak123/devops-cicd-app:1.0 .
Container Principle
Java Application
       │
       ▼
     JAR
       │
       ▼
 Docker Image
       │
       ▼
Container Runtime
       │
       ▼
Kubernetes
📦 Docker Hub

Docker Hub is used as the container registry.

Repository:

rounak123/devops-cicd-app

Jenkins authenticates using Jenkins Credentials.

Credentials are intentionally not hard-coded into the Jenkinsfile.

☸️ Kubernetes

The application is deployed using Kubernetes running on K3s.

Kubernetes Resources
kubernetes/
│
├── deployment.yaml
└── service.yaml
Deployment
Deployment
     │
     ▼
 ReplicaSet
     │
     ▼
    Pod
     │
     ▼
Container
     │
     ▼
Java Application

The Deployment manages the desired application state.

Current configuration:

Replicas : 1
Container Port : 8081
🌐 Kubernetes Service

The application is exposed through a Kubernetes NodePort Service.

External Request
       │
       ▼
AWS EC2
       │
       ▼
NodePort : 30255
       │
       ▼
Service : 8081
       │
       ▼
Pod : 8081
       │
       ▼
Java Application

Application port:

8081

NodePort:

30255
🏗️ Terraform — Infrastructure as Code

Terraform manages infrastructure configuration using declarative code.

Terraform Concepts Implemented
Provider configuration
AWS authentication
Data sources
Variables
.tfvars.example
Local values
Modules
for_each
Outputs
Tags
Security groups
State management
Provider lock file
Terraform Structure
terraform/
│
├── main.tf
├── variables.tf
├── terraform.tfvars.example
├── .terraform.lock.hcl
├── .gitignore
│
└── modules/
    └── security_group/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
Terraform Workflow
terraform init
terraform fmt
terraform validate
terraform plan

Terraform state is intentionally excluded from Git.

🔐 Terraform Authentication

The project demonstrates AWS IAM role-based authentication rather than storing long-lived AWS access keys directly on the EC2 server.

The EC2 instance assumes an IAM role:

EC2
 │
 ▼
IAM Role
 │
 ▼
AWS Temporary Credentials
 │
 ▼
Terraform / AWS CLI

This reduces the need to store permanent access keys on the server.

⚙️ Ansible Configuration Management

Ansible is used for configuration management and server automation.

Capabilities Demonstrated
Inventory
SSH connectivity
Variables
Playbooks
Roles
Handlers
Loops
Docker deployment
Remote execution
Execution Model
Ansible Controller
       │
       │ SSH
       ▼
Managed EC2 Server
       │
       ├── Packages
       ├── Docker
       └── Application Configuration
☁️ AWS Environment

The project is hosted on AWS EC2 using Ubuntu Linux.

AWS Components
AWS
│
├── EC2
├── IAM
├── Security Groups
├── EBS
└── CloudWatch
Compute
Amazon EC2
Ubuntu Linux
Storage
Amazon EBS
Access Control
IAM
Security Groups
SSH Keys
🔒 Security Design

Security is considered throughout the project rather than treated as a separate final step.

Identity
IAM role-based AWS authentication
SSH key-based server access
Jenkins credential store
Secrets

Sensitive values are not stored directly in:

GitHub
Jenkinsfile
Terraform source files
Dockerfile
Git Protection

Excluded from Git:

*.tfstate
*.tfstate.*
.terraform/
*.tfvars

The repository contains:

terraform.tfvars.example

instead of a real secret-containing .tfvars file.

🌐 Network & Access Model

The application uses controlled network access through AWS Security Groups and Kubernetes Service configuration.

Example traffic path:

Client
  │
  ▼
AWS Security Group
  │
  ▼
EC2
  │
  ▼
Kubernetes NodePort
  │
  ▼
Kubernetes Service
  │
  ▼
Application Pod
  │
  ▼
Java Application
📊 Observability

The current implementation uses AWS CloudWatch and Kubernetes operational commands for basic visibility.

Operational checks include:

kubectl get nodes
kubectl get pods
kubectl get deployments
kubectl get services
kubectl rollout status deployment/devops-app

AWS infrastructure visibility is provided through CloudWatch.

Planned Observability Stack
Prometheus
     │
     ▼
Metrics
     │
     ▼
Grafana
     │
     ▼
Dashboards

Centralized logging is also planned as a future enhancement.

🩺 Health & Reliability

The project includes rollout verification in the CI/CD pipeline.

Example:

kubectl rollout status deployment/devops-app --timeout=120s

This prevents Jenkins from reporting a successful deployment before Kubernetes confirms rollout completion.

🔄 Deployment Strategy

The deployment process follows:

Source
  ↓
Build
  ↓
Test
  ↓
Package
  ↓
Containerize
  ↓
Publish
  ↓
Deploy
  ↓
Verify

Kubernetes manages the desired state of the application.

Future iterations can introduce:

Readiness probes
Liveness probes
Rolling deployment controls
Resource requests
Resource limits
Automated rollback
🚨 Troubleshooting & Operations

The project includes practical troubleshooting across multiple layers.

Git

Common issues:

Authentication failures
Remote repository problems
Branch synchronization
Merge conflicts
Jenkins

Common issues:

Credential failures
SCM checkout problems
Build failures
Pipeline stage failures
Agent/tool configuration
Docker

Common issues:

Permission errors
Image build failures
Registry authentication
Image push failures
Kubernetes

Common issues:

Pod CrashLoopBackOff
ImagePullBackOff
Service connectivity
Rollout failures
API server connectivity
Resource constraints
Terraform

Common issues:

Provider initialization
AWS authentication
Validation errors
State management
Resource configuration
Module errors
AWS

Common issues:

Security Group configuration
SSH connectivity
IAM permissions
EC2 resource constraints
Storage capacity
💡 Engineering Decisions
Why K3s?

K3s provides a lightweight Kubernetes environment suitable for a resource-constrained development environment.

Why Maven?

Maven provides standardized Java dependency management, testing, compilation, and packaging.

Why Docker?

Docker provides a consistent application runtime between build and deployment environments.

Why Jenkins?

Jenkins provides an extensible CI/CD automation platform and integrates with GitHub, Maven, Docker, and Kubernetes.

Why Terraform?

Terraform allows infrastructure configuration to be version-controlled and reproduced through code.

Why Ansible?

Ansible complements Terraform by handling operating-system and application configuration after infrastructure exists.

Why IAM Roles?

IAM roles avoid unnecessary long-lived AWS access keys on EC2 instances.

💰 Cost-Conscious AWS Design

The project is designed with AWS cost awareness in mind.

The environment avoids unnecessary services such as:

NAT Gateway
Managed Kubernetes control planes
Unnecessary load balancers
Paid domains
Multiple large instances

Resources are kept intentionally lightweight for development and portfolio demonstration.

AWS pricing and Free Tier eligibility can change. Always verify current AWS pricing and Free Tier eligibility before creating resources.

🧪 Reproducibility

The project keeps infrastructure and deployment configuration inside Git so the environment can be recreated from documented configuration.

The repository contains:

Application Code
       +
CI/CD Pipeline
       +
Docker Configuration
       +
Kubernetes Manifests
       +
Terraform Configuration
       +
Ansible Configuration
       +
Documentation

This makes the project easier to understand, review, and reproduce.

📈 Future Improvements

The following improvements are planned:

CI/CD
Dynamic Docker image tags
GitHub webhook automation
Build artifact retention
Deployment approval gates
Automated rollback
Kubernetes
Liveness probes
Readiness probes
Resource requests and limits
Horizontal Pod Autoscaling
ConfigMaps
Secrets
Ingress
Rolling deployment strategy
Observability
Prometheus
Grafana
Centralized logging
Application metrics
Alerting
Security
Image vulnerability scanning
Least-privilege IAM policies
Network restriction improvements
Secret management
Container security hardening
Terraform
Remote state
State locking
Reusable infrastructure modules
Separate environments
CI-based Terraform validation
🎯 Project Outcomes

This project demonstrates practical implementation of:

CI/CD
Git
GitHub
Jenkins
Maven
JUnit
Docker
Docker Hub
Kubernetes
K3s
AWS EC2
IAM
Security Groups
Terraform
Ansible
Linux
Networking
Infrastructure as Code
Configuration Management
Deployment Automation
Troubleshooting
Security practices
📌 Key Takeaway

The project demonstrates an end-to-end DevOps delivery model:

Code
 ↓
Version Control
 ↓
Continuous Integration
 ↓
Automated Testing
 ↓
Build
 ↓
Containerization
 ↓
Container Registry
 ↓
Kubernetes Deployment
 ↓
Infrastructure Automation
 ↓
Operational Verification

The implementation is designed as a practical DevOps portfolio project using production-oriented engineering practices while remaining suitable for a low-cost development environment.

👨‍💻 Author
Rounak Singh

DevOps / Cloud Engineering Portfolio

Technologies
AWS
Linux
Git
GitHub
Jenkins
Maven
JUnit
Docker
Kubernetes
K3s
Terraform
Ansible
Bash
📄 License

This project is intended for learning, portfolio demonstration, and technical practice.
