terraform {
  backend "s3" {
    region         = "eu-central-1"
    bucket         = "terraform-eks-dev"
    key            = "terraform.tfstate"
    encrypt        = "true"
    dynamodb_table = "terraform-state-lock"
  }
}
