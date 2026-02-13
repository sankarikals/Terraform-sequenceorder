# Deployment — Multi-Environment Terraform Setup:

This project provisions four isolated servers using Terraform with different user-data configurations, while sharing a common VPC. Each server maintains its own IAM role, security group, and bootstrap configuration.

Terraform remote state is managed using AWS S3 with DynamoDB state locking to ensure safe concurrent operations.

The architecture allows:

Independent environment deployment
Selective server creation
Controlled server destruction
Safe remote state management

# Architecture Overview

Shared VPC for all servers
Server-specific IAM roles
Dedicated security groups
Unique user-data per server
Remote Terraform state storage
DynamoDB state locking

Each environment operates independently and can be created or destroyed without impacting others.

# Prerequisites

Before running Terraform, ensure the following tools and configurations are completed:

Install Required Tools AWS CLI installed and configured Terraform installed Git installed
Configure AWS credentials: aws configure

Backend Configuration (One-Time Setup) Terraform remote state requires an S3 bucket and DynamoDB table.
a) Create S3 Bucket (manual step)

Create an S3 bucket to store Terraform state files. Use a unique bucket name.

terraform-state-terraformcicd

b) Create DynamoDB Lock Table

This table prevents concurrent Terraform runs.

aws dynamodb create-table
--table-name terraform-lock-dev
--attribute-definitions AttributeName=LockID,AttributeType=S
--key-schema AttributeName=LockID,KeyType=HASH
--billing-mode PAY_PER_REQUEST
--region us-east-1

# Deploy Full Environment  :

Navigate to the respective environment directory before running Terraform.

For enviornment:

1.Move to dev directory cd environments/dev

Initialize Terraform backend: terraform init -reconfigure

Plan deployment:terraform plan -var-file="../../tfvars/dev.tfvars"

Apply infrastructure:: terraform apply -var-file="../../tfvars/dev.tfvars"

# Destroy Full Enviornment :

Destroy Dev Infrastructure terraform destroy -var-file="../../tfvars/dev.tfvars"

# Deploy or Destroy Individual Server:

You can target a specific server module without affecting others.

Example — Server 1:

1.Move to dev directory cd environments/dev

Initialize Terraform backend: terraform init -reconfigure

Plan deployment:terraform plan -target=module.server1 -var-file="../../tfvars/qa.tfvars"

Apply infrastructure:: terraform apply -target=module.server1 -var-file="../../tfvars/qa.tfvars"

To destroy :

Destroy Dev Infrastructure terraform destroy -target=module.server1 -var-file="../../tfvars/qa.tfvars"

Note: Targeted operations affect only the specified server module. Shared infrastructure such as the VPC remains untouched.

If you want to down the complete infra then follow Destroy Full Enviornment.  <<terraform destroy -var-file="../../tfvars/qa.tfvars" >>

# Best Practices :

Always re-initialize Terraform after backend changes
Use environment-specific tfvars files
Use targeted destroy cautiously
Enable state locking for team safety

# Result

You now have:

Multi-environment Terraform deployment
Isolated server lifecycle control
Safe remote state management
Flexible infrastructure orchestration
