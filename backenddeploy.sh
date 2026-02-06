#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <server-name>"
    exit 1
fi

SERVER="$1"
ENV_DIR="bootstrap/$SERVER"

if [ ! -d "$ENV_DIR" ]; then
    echo "Error: Bootstrap folder '$ENV_DIR' does not exist!"
    exit 1
fi

echo "🚀 Deploying $SERVER..."
cd "$ENV_DIR"

terraform init -reconfigure
terraform plan -out="$SERVER.plan"
terraform apply -auto-approve "$SERVER.plan"

echo "✅ Deployment of $SERVER completed!"
terraform output

