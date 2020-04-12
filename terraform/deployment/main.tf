# VPC Module
module "vpc" {

  source          = "../modules/shared_vpc"
  cidr            = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  environment     = "krypton"
  ingress_ips     = var.ingress_ips
  cluster_name    = var.cluster_name

}

# VPC Module
module "kops" {

  source      = "../modules/kops_resources"
  environment = "krypton"
  ingress_ips = var.ingress_ips
  vpc_id      = module.vpc.vpc_id
}

# Integrate Postgresql RDS
# module "rds" {

#   source              = "../modules/postgres_rds"
#   vpc_id              = module.vpc.vpc_id
#   rds_cidr            = var.rds_cidr
#   rds_az              = var.rds_az
#   rds_cidr_blocks     = var.rds_cidr_blocks
#   db_pass             = var.db_pass

# }

# Create ECR Repo and push the app image

module "ecr" {
  source      = "../modules/ecr"
  image_name  = var.image_name
}
module "app_env" {
  source          = "../modules/app_env"
  k8s_app_lb_name = var.k8s_app_lb_name
  zone_name       = var.zone_name
}
