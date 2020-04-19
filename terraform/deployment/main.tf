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

# KOPS
module "kops" {

  source      = "../modules/kops_resources"
  environment = "krypton"
  ingress_ips = var.ingress_ips
  vpc_id      = module.vpc.vpc_id
}

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
