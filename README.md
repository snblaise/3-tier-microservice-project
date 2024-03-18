# Runbook: Creating a 3-tier VPC on AWS using Terraform

## Prerequisites
Before starting, ensure you have the following prerequisites:
- AWS CLI installed and configured with appropriate credentials.
- Terraform installed on your local machine.
- Basic knowledge of AWS services and Terraform.

Links:
- [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Architecture Diagram


## Tools and Services
The project will incorporate the following tools and services:
- AWS: For cloud infrastructure.
- Terraform: For infrastructure as code.
- GitHub: For version control and collaboration.
- S3: For storing Terraform state files.

## Folder Structure
```
aeon-website-ecs/
├── module/
│   └── vpc_module/
│       ├── main.tf
│       ├── variables.tf
│       └── output.tf
└── aeon-three-vpc/
    ├── main.tf
    ├── variables.tf
    ├── terraform.tfvars
    ├── backend.tf
    └── README.md
```

## Steps to Create the 3-Tier VPC

1. **Create GitHub Repository**
   - Create a new GitHub repository named `aeon-website-ecs`.
   - Clone the repository to your local machine.

2. **Create S3 Bucket for Terraform State**
   - Login to AWS console.
   - Create an S3 bucket named `sn-aeon-terraform-remote-state`.
   - Set the bucket region to `us-east-1`.
   - Set the bucket key for storing Terraform state files as `"aeon-website-ecs.tfstate"`.
   - Ensure that the AWS profile used has appropriate permissions.

3. **Create Module Folder**
   - Inside the cloned repository, create a folder named `module/vpc_module`.
   - Create files `main.tf`, `variables.tf`, and `output.tf` inside `vpc_module`.
   

4. **Create Project Folder**
   - Create a folder named `aeon-three-vpc` in the root of the repository.

   - Create files `main.tf`, `variables.tf`, `terraform.tfvars`, and `backend.tf` inside `aeon-three-vpc`.

5. **Configure Backend for State File Storage**
   - In `backend.tf`, specify the S3 bucket to store Terraform state files.
     ```hcl
     terraform {
       backend "s3" {
         bucket         = "sn-aeon-terraform-remote-state"
         key            = "aeon-website-ecs.tfstate"
         region         = "us-east-1"
         profile        = "default"
       }
     }
     ```

6. **Create Terraform Configuration**
   - Define the VPC, subnets, route tables, and necessary resources in `main.tf`, `variables.tf` and `output.tf` files.
   - Utilize the `vpc_module` from the `module` directory in `main.tf` of the `aeon-three-vpc` project.
7. **Create Terraform Variables File**
   - Populate `terraform.tfvars` with required variables and their values.
     ```hcl
     region = "us-east-1"
     vpc_cidr_block = "10.0.0.0/16"
     ```
   
8. **Run Terraform Commands**
   - Initialize Terraform:
     ```sh
     terraform init
     ```
   - Plan the infrastructure changes:
     ```sh
     terraform plan
     ```
   - Apply the changes to create the VPC:
     ```sh
     terraform apply
     ```

9. **Verify and Cleanup**
   - Verify the resources created in the AWS console.
   - When done, destroy the infrastructure to avoid unnecessary charges:
     ```sh
     terraform destroy
     ```

