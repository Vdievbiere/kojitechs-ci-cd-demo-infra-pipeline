
################################################################################
# CONFIGURE BACKEND
################################################################################

terraform {
  required_version = ">=1.1.0" 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

################################################################################
# PROVIDERS BLOCK
################################################################################

provider "aws" {
  region = "us-east-1"
}

################################################################################
# LOCALS BLOCK
################################################################################

locals {
  vpc_id   = module.vpc.vpc_id
   azs = data.aws_availability_zones.available.names

}


################################################################################
# DATA SOURCE BLOCK
################################################################################

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

################################################################################
# RESOURCE BLOCK
################################################################################

resource "aws_instance" "jenkins-server" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.large"
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  user_data = file("${path.module}/templates/jenkins.sh")  

  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_instance" "sonarqube-server" {
  ami           = data.aws_ami.ami.id
  instance_type ="t3.large"
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.sonarqube_sg.id]
   user_data = file("${path.module}/templates/sonarqube.sh") 

  tags = {
    Name = "sonarqube-server"
  }
}


################################################################################
# MODULES BLOCK
################################################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.component_name}-vpc"
  cidr = var.vpc_cidr 

  azs             = slice(local.azs, 0, 3)# Data source
  private_subnets = var.public_subnetcidr 
  public_subnets  = var.private_subnetcidr 

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}