#!/bin/bash

# Exit immediately if any command fails
set -e

# ==============================
# Variables (update as needed)
# ==============================
BOOTSTRAP_DIR="$(dirname "$0")"
ENV_DIR="$(realpath "$BOOTSTRAP_DIR/../../../environments/server1")"
AWS_REGION="us-east-1"
BUCKET_NAME="terraform-server1-state"    # S3 bucket created by bootstrap

# ==============================
# Step 1: Bootstrap
# ==============================
echo "=============================="
echo "Step 1: Running Bootstrap..."
echo "=============================="

cd "$BOOTSTRAP_DIR"

# Check if S3 bucket exists in AWS
if aws s3api head-bucket --bucket "$BUCKET_NAME" --region "$AWS_REGION" 2>/dev/null; then
    echo "Bootstrap bucket '$BUCKET_NAME' already exists, skipping..."
else
    echo "Bootstrap bucket not found. Running Terraform bootstrap..."
    terraform init
    terraform plan -out=bootstrap.plan
    terraform apply -auto-approve bootstrap.plan
    echo "Bootstrap completed."
fi

# ==============================
# Step 2: Deploy Environment
# ==============================
echo "=============================="
echo "Step 2: Deploying Environment..."
echo "=============================="

cd "$ENV_DIR"

# Initialize Terraform with remote backend reconfiguration
terraform init -reconfigure

# Plan & apply environment
terraform plan -out=env.plan
terraform apply -auto-approve env.plan

# Output important information (like EC2 public IP)
echo "=============================="
echo "Terraform deployment completed. Outputs:"
terraform output
