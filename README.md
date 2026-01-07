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
<img width="1920" height="1080" alt="Screenshot (564)" src="https://github.com/user-attachments/assets/d1e32486-013c-4c07-a51b-ca4df317cefe" />
<img width="1920" height="1080" alt="Screenshot (568)" src="https://github.com/user-attachments/assets/28983af5-a182-4981-9fe9-4c26b00a07cc" />
<img width="1920" height="1080" alt="Screenshot (567)" src="https://github.com/user-attachments/assets/0cada63c-9546-480a-b2c7-2c5d43fc579e" />
<img width="1920" height="1080" alt="Screenshot (566)" src="https://github.com/user-attachments/assets/cc675351-3880-425b-ad6c-2a6a9eef39db" />
<img width="1920" height="1080" alt="Screenshot (565)" src="https://github.com/user-attachments/assets/79016c5b-de96-4917-858b-39dbb572b7bf" />

│ └── ci.yml # GitHub Actions workflow
├── Dockerfile # Container definition
├── setup.sh # Automated deployment script
├── system-checks.sh # Validation script
├── .gitignore # Git ignore rules
└── README.md # This file
