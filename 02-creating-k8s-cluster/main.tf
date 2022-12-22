terraform {
  required_version = ">= 0.13.1"
  
  required_providers {
    aws = ">= 3.54.0"
    local = ">= 2.1.0"
  }
  
  backend "s3" {
    bucket = "my-fullcycle-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}

module "new-vpc" {
    source = "./modules/vpc"
    
    prefix = var.prefix
    vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
  source = "./modules/eks"

  vpc_id = module.new-vpc.vpc_id
  subnet_ids = module.new-vpc.subnet_ids
  
  prefix = var.prefix
  cluster_name = var.cluster_name
  logs_retention_in_days = var.logs_retention_in_days
  node_desired_size = var.node_desired_size
  node_max_size = var.node_max_size
  node_min_size = var.node_min_size
}