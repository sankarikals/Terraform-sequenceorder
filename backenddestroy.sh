#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <server-name>"
    exit 1
fi

SERVER="$1"
ENV_DIR="bootstrap/$SERVER"

cd "$ENV_DIR"

terraform init -reconfigure
terraform destroy -auto-approve

echo "✅ Destroyed $SERVER successfully!"

