# Terraform AWS VPC with Public and Private EC2 Instances

## 📌 Project Overview

This project uses **Terraform** to create a secure AWS infrastructure that includes a **VPC, Public Subnet, Private Subnet, NAT Gateway, Security Groups, and EC2 instances**.

The architecture allows:

* Public EC2 instance accessible from the internet
* Private EC2 instance accessible only through the public instance (Bastion Host)
* Private instance internet access via **NAT Gateway**

This project demonstrates **Infrastructure as Code (IaC)** using Terraform.

---

# 🏗 Architecture

Internet
│
▼
Internet Gateway
│
Public Route Table
│
Public Subnet
│
Public EC2 Instance (Bastion Host)
│
SSH Access
│
Private Subnet
│
Private EC2 Instance
│
NAT Gateway → Internet Access

---

# ⚙️ Technologies Used

* AWS (Amazon Web Services)
* Terraform
* EC2
* VPC Networking
* NAT Gateway
* Security Groups

---

# ☁️ Infrastructure Components

## 1️⃣ VPC

Creates a Virtual Private Cloud.

CIDR Block:

```
10.0.0.0/16
```

---

## 2️⃣ Subnets

### Public Subnet

CIDR:

```
10.0.1.0/24
```

Features:

* Automatically assigns Public IP
* Used for public EC2 instance

### Private Subnet

CIDR:

```
10.0.2.0/24
```

Features:

* No Public IP
* Used for private EC2 instance

---

## 3️⃣ Internet Gateway

Provides internet access to the **public subnet**.

---

## 4️⃣ NAT Gateway

Allows **private subnet instances to access the internet** for:

* Software updates
* Package installations

Without exposing them to public internet.

---

## 5️⃣ Route Tables

### Public Route Table

Routes internet traffic to:

```
0.0.0.0/0 → Internet Gateway
```

### Private Route Table

Routes internet traffic to:

```
0.0.0.0/0 → NAT Gateway
```

---

## 6️⃣ Security Groups

### Public Security Group

Allows:

* SSH (Port 22) from anywhere

### Private Security Group

Allows:

* SSH only from the **Public EC2 Instance**

---

## 7️⃣ EC2 Instances

### Public EC2 Instance

* Located in Public Subnet
* Has Public IP
* Used as **Bastion Host**

### Private EC2 Instance

* Located in Private Subnet
* No Public IP
* Accessible only through Public EC2

---

# 📂 Project Structure

```
terraform-vpc-project
│
├── main.tf
├── README.md
```

---

# ✅ Prerequisites

Before running Terraform:

Install the following:

* Terraform
* AWS CLI
* AWS Account
* IAM permissions for VPC, EC2, and networking

Verify Terraform installation:

```
terraform -version
```

---

# 🚀 Deployment Steps

## 1️⃣ Initialize Terraform

```
terraform init
```

---

## 2️⃣ Validate Configuration

```
terraform validate
```

---

## 3️⃣ Preview Infrastructure

```
terraform plan
```

---

## 4️⃣ Apply Configuration

```
terraform apply
```

Type:

```
yes
```

Terraform will create all AWS resources.

---

# 🗑 Destroy Infrastructure

To delete all created resources:

```
terraform destroy
```

---

# 🎯 Learning Outcomes

This project helps understand:

* Terraform Infrastructure as Code
* AWS VPC Networking
* Public vs Private Subnet
* NAT Gateway architecture
* Bastion Host concept
* Security Group configuration

---

# 👨‍💻 Author

Shubham Tippe
Cloud & DevOps Learner

---

# 📜 License

This project is for learning and educational purposes.
