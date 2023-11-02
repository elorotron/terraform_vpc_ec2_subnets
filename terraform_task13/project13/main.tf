provider "aws" {
  region = "eu-central-1"
}



module "vpc-dev" {
  source = "../modules/aws_net"
  #source               = "git@github.com:elorotron/<name_of_repo>.git//aws_net"
  env                  = var.enviroment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_sub_cidrs
  private_subnet_cidrs = var.private_sub_cidrs
}

module "vpc-sg" {
  source     = "../modules/aws_sg"
  ports_open = var.open_ports
  vpc_id     = module.vpc-dev.vpc_id
  env        = module.vpc-dev.env
  vpc_cidr   = module.vpc-dev.vpc_cidr
}

module "ec2" {
  source             = "../modules/aws_ec2"
  env                = module.vpc-dev.env
  vpc_public_sg_id   = module.vpc-sg.vpc_public_sg_id
  vpc_private_sg_id  = module.vpc-sg.vpc_private_sg_id
  instance_type      = var.ec2_instance_type
  public_subnet_ids  = module.vpc-dev.public_subnet_ids
  private_subnet_ids = module.vpc-dev.private_subnet_ids
}

#-------------------------------------------------------------------------------------------
