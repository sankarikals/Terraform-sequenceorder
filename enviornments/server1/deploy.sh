#!/bin/bash

set -e

echo "🚀 Deploying server1 environment..."

terraform init -reconfigure
terraform plan
terraform apply -auto-approve

echo "✅ Deployment completed!"
terraform output
