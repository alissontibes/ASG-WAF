provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source    = "./modules/vpc"
  vpc_cidr  = var.vpc_cidr
  vpc_name  = "my-vpc"
}

# Subnets
module "subnets" {
  source              = "./modules/subnets"
  vpc_id              = module.vpc.vpc_id
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  availability_zones  = var.availability_zones
}

# Internet Gateway
module "internet_gateway" {
  source  = "./modules/internet-gateway"
  vpc_id  = module.vpc.vpc_id
}

# NAT Gateway
module "nat_gateway" {
  source             = "./modules/nat-gateway"
  public_subnet_id   = module.subnets.public_subnet_ids[0]
}

# Route Tables
module "route_tables" {
  source                 = "./modules/route-tables"
  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.subnets.public_subnet_ids
  private_subnet_ids     = module.subnets.private_subnet_ids
  igw_id                 = module.internet_gateway.igw_id
  nat_gateway_id         = module.nat_gateway.nat_id
}

# Security Groups
module "security_groups" {
  source  = "./modules/security-groups"
  vpc_id  = module.vpc.vpc_id
}


# ========================================
# Check Point CloudGuard WAF
# ========================================
module "cloudguard_waf" {
  source = "./modules/cloudguard-waf"

  ssh_key_name      = var.ssh_key_name
  public_subnet_id  = module.subnets.public_subnet_ids[0]  # take first subnet dynamically
  waf_ami_id        = data.aws_ami.cloudguard_waf.id
  infinity_token    = var.infinity_token
  security_group_id = module.security_groups.waf_sg_id
  instance_type = var.waf_instance_type       # example variable from root variables.tf

}


