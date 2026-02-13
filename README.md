🚀 Terraform Multi-Server Environment — Deployment Guide
📌 Overview

This project provisions four independent AWS server environments using Terraform. Each server environment is isolated and includes:

Dedicated EC2 instance

Dedicated security group

Dedicated IAM role

Dedicated user-data bootstrap configuration

Independent Terraform backend state

Each environment can be:

✅ Created independently
✅ Destroyed independently
✅ Managed via automation scripts

This design allows selective lifecycle control without affecting other environments.

🏗 Architecture Concept

We deploy four sequential server environments, each treated as an independent Terraform stack.

Server	Instance Type	Description
server1	t2.micro	Lightweight workload
server2	t2.medium	Medium workload
server3	t2.micro	Lightweight workload
server4	t2.medium	Medium workload

Each server environment includes:

Separate Terraform state backend

Dedicated networking/security

Unique EC2 configuration

Custom user-data initialization

This guarantees safe, isolated infrastructure operations.


Project Structure

Terraform-CICD/
│
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── security_group/
│   └── iam-role/
│
├── bootstrap/
│   ├── server1/
│   ├── server2/
│   ├── server3/
│   └── server4/
│
├── environments/
│   ├── server1/
│   ├── server2/
│   ├── server3/
│   └── server4/
│
├── scripts/
│   ├── backenddeploy.sh
│   ├── deploy.sh
│   └── destroy.sh
│
├── README.md
└── .gitignore

⚙ Prerequisites

Install the following tools before starting:

Required Tools

AWS CLI

Terraform

Git

Bash shell (Linux/macOS/Git Bash)

AWS Configuration

Configure credentials:

aws configure


Ensure your IAM user has permissions for:

EC2

S3

IAM

VPC

DynamoDB

Step 1 — Backend Bootstrap (One-Time Setup)

Each server requires a dedicated Terraform remote backend.

Run:

./backenddeploy.sh server1


You can replace server1 with:

server2
server3
server4

What this step creates

S3 bucket for Terraform state

DynamoDB table for state locking

⚠ This step is required only once per environment.

Step 2 — Deploy Server Infrastructure

After backend setup:

./deploy.sh server1


Terraform provisions:

VPC

Security group

IAM role

EC2 instance

User-data configuration

Each server environment runs independently.

Step 3 — Destroy Specific Server Environment

To destroy a single environment:

./destroy.sh server3

This removes only server3 infrastructure.


Other servers remain untouched.

Selective Lifecycle Examples
Deploy server2 only
./backenddeploy.sh server2
./deploy.sh server2

Destroy server1 only
./destroy.sh server1

🔄 Deployment Workflow
Backend Bootstrap → Deploy → Destroy (optional)


Flow:

backenddeploy.sh → deploy.sh → destroy.sh


Each environment maintains independent state and lifecycle.