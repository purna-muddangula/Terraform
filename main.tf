# main.tf

# Provider configuration
provider "aws" {
  region = "ap-south-1"
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Allow access to RDS instance"

  ingress {
    from_port   = 3306           # MySQL port, adjust for other engines
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all IPs (change for security)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Subnet group for RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = ["subnet-12345678", "subnet-87654321"]  # Replace with actual subnet IDs

  tags = {
    Name = "RDS Subnet Group"
  }
}

# Create the RDS instance
resource "aws_db_instance" "my_rds" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "mydatabase"
  username             = "admin"
  password             = "password123"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible  = true
  skip_final_snapshot  = true

  tags = {
    Name = "MyRDSInstance"
  }
}





