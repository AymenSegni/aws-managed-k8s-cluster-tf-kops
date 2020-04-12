variable "environment" {
  type        = string
  default     = "krypton"
  description = "Name prefix"
}

variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable "azs" {
  type        = list
  description = "Avaibility zones list"
}

variable "private_subnets" {
  type        = list
  description = "list of private subnets in the vpc"
}

variable "public_subnets" {
  type        = list
  description = "public subnets list"
}

variable "ingress_ips" {
  type        = list
  description = "List of Ingress IPs"
}
variable "cluster_name" {
  type        = string
  description = "FQDN cluster name"
}
