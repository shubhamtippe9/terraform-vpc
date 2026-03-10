# Terraform AWS VPC Project

## Project Overview

This project creates an AWS infrastructure using **Terraform**.

It creates:

* VPC
* Public Subnet
* Private Subnet
* Internet Gateway
* NAT Gateway
* Route Tables
* Security Groups
* Public EC2 Instance
* Private EC2 Instance

The public EC2 instance can access the internet, and the private EC2 instance can be accessed through the public instance.

---

# Architecture

Internet
↓
Internet Gateway
↓
Public Subnet
↓
Public EC2 Instance
↓
Private Subnet
↓
Private EC2 Instance
↓
NAT Gateway → Internet

---

# Files in Project

```id="fd4uq9"
terraform-project
│
├── main.tf
├── output.tf
└── README.md
```

---

# main.tf

This file contains all Terraform resources like:

* VPC
* Subnets
* Internet Gateway
* NAT Gateway
* Security Groups
* EC2 Instances

---

# output.tf

This file shows the **Public IP of the EC2 instance** after Terraform creates the infrastructure.

Example:

```hcl id="k0gc6w"
output "instance_public_ip" {
  value = aws_instance.public_instance.public_ip
}
```

After running Terraform, it will display:

```id="e5ubgs"
instance_public_ip = 54.xx.xx.xx
```

---

# Requirements

Before running this project you need:

* AWS Account
* AWS CLI
* Terraform installed

Check Terraform version:

```id="eg7o0r"
terraform -version
```

---

🚀 Deployment Steps

### 1 Initialize Terraform

```id="r2uhb6"
terraform init
```

### 2 See Plan

```id="5nww0k"
terraform plan
```

### 3 Create Infrastructure

```id="r92pxo"
terraform apply --auto-approve
```

# Destroy Resources

To delete all resources:

```id="eb0j4u"
terraform destroy --auto-approve
```

---

🎯 Learning Outcomes

This project helps understand:

Terraform Infrastructure as Code

AWS VPC networking

Public vs Private Subnet

NAT Gateway usage

Bastion Host architecture

Terraform outputs

👨‍💻 Author

Shubham Tippe
Cloud & DevOps Learner

📜 License

This project is for educational and learning purposes.
