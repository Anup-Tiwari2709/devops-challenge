#!/bin/bash

set -e  # Exit on error

echo "=========================================="
echo "DevOps Challenge - Local Setup Script"
echo "=========================================="

# Check prerequisites
command -v docker >/dev/null 2>&1 || { echo "Error: docker is required but not installed."; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo "Error: kubectl is required but not installed."; exit 1; }
command -v terraform >/dev/null 2>&1 || { echo "Error: terraform is required but not installed."; exit 1; }
command -v helm >/dev/null 2>&1 || { echo "Error: helm is required but not installed."; exit 1; }

echo ""
echo "Step 1: Building Docker image..."
docker build -t devops-challenge-app:latest . || { echo "Docker build failed"; exit 1; }
echo "✓ Docker image built successfully"

echo ""
echo "Step 2: Initializing Terraform..."
cd terraform
terraform init || { echo "Terraform init failed"; exit 1; }
echo "✓ Terraform initialized"

echo ""
echo "Step 3: Applying Terraform configuration..."
terraform apply -auto-approve || { echo "Terraform apply failed"; exit 1; }
echo "✓ Terraform applied successfully"
cd ..

echo ""
echo "Step 4: Deploying with Helm..."
helm upgrade --install devops-challenge ./helm \
  --namespace devops-challenge \
  --wait || { echo "Helm deployment failed"; exit 1; }
echo "✓ Helm chart deployed successfully"

echo ""
echo "=========================================="
echo "Deployment Complete!"
echo "=========================================="
echo ""
echo "To access the application:"
echo "  kubectl port-forward -n devops-challenge svc/devops-challenge-service 8080:80"
echo "  Or access via NodePort: http://localhost:30080"
echo ""
echo "To verify deployment, run:"
echo "  ./system-checks.sh"
