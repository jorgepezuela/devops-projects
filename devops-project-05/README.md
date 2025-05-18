# EKS CI/CD Pipeline with GitHub Actions

This project demonstrates how to deploy an EKS cluster and a simple Nginx application using GitHub Actions for CI/CD.

## Project Structure

```
├── terraform/           # Terraform configuration for EKS
│   ├── main.tf         # Main Terraform configuration
│   └── variables.tf    # Terraform variables
├── k8s/                # Kubernetes manifests
│   ├── deployment.yaml # Nginx deployment
│   └── service.yaml    # Nginx service
├── .github/workflows/  # GitHub Actions workflows
│   └── ci-cd.yml       # CI/CD pipeline
└── README.md          # Project documentation
```

## Prerequisites

1. AWS Account with appropriate permissions
2. GitHub repository
3. GitHub Secrets:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY

## Features

1. Automated EKS cluster deployment using Terraform
2. Nginx application deployment using Kubernetes manifests
3. GitHub Actions workflow for CI/CD
4. Infrastructure as Code (IaC) with Terraform
5. Complete automation from infrastructure to application deployment

## Usage

1. Clone the repository
2. Configure GitHub Secrets with your AWS credentials
3. Push changes to trigger the CI/CD pipeline

The pipeline will:
1. Initialize and apply Terraform configuration
2. Create EKS cluster with VPC and node groups
3. Deploy Nginx application to the cluster

## Cleanup

To destroy the infrastructure:

```bash
terraform destroy -auto-approve
```