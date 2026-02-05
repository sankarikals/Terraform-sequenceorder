#!/bin/bash

set -e

echo "🚀 Deploying server3-backend environment..."

terraform init -reconfigure
terraform plan
terraform apply -auto-approve

echo "✅ Deployment completed!"
terraform output
