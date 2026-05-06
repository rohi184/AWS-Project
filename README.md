# Project Name

## 📌 Overview
What this project does in 2-3 lines

## 🏗️ Architecture
![Architecture Diagram](architecture/architecture-diagram.png)

## ⚙️ AWS Services Used
- Amazon VPC
- EC2 (2 instances across 2 AZs)
- Application Load Balancer
- RDS MySQL (private subnet)

## 🔐 Security Design
- EC2 only accepts traffic from ALB
- RDS only accepts traffic from EC2
- Database has no public access

## 📸 Screenshots
(add your screenshots here)

## 📚 What I Learned
- How to design public/private subnet architecture
- How ALB distributes traffic across AZs
- Why databases should never be in public subnets
