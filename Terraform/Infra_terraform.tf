provider "aws" {
region = var.inst_region
}

module "ec2" {
source = "./module/ec2"
}

module "vpc" {
source = "./module/vpc"
}
