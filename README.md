cat > README.md << 'EOF'
# DevOps Challenge: Secure-Boot Initiative

A secure, containerized Python API deployed on Kubernetes with full automation.

## Project Overview

This project demonstrates a production-ready DevOps workflow with:
- Secure non-root container execution binding to port 80
- Infrastructure as Code using Terraform
- Kubernetes deployment with Helm
- CI/CD automation with GitHub Actions
- Security-first approach with read-only filesystems

## Repository Structure

/
├── app/ # Python Flask API
│ ├── main.py # API application code
│ └── requirements.txt # Python dependencies
├── helm/ # Helm chart for Kubernetes deployment
│ ├── Chart.yaml # Chart metadata
│ ├── values.yaml # Configuration values
│ └── templates/
│ ├── deployment.yaml # Kubernetes Deployment
│ └── service.yaml # Kubernetes Service
├── terraform/ # Infrastructure as Code
│ ├── main.tf # Terraform resources
│ └── outputs.tf # Terraform outputs
├── .github/workflows/ # CI/CD pipeline
│ └── ci.yml # GitHub Actions workflow
├── Dockerfile # Container definition
├── setup.sh # Automated deployment script
├── system-checks.sh # Validation script
├── .gitignore # Git ignore rules
└── README.md # This file
