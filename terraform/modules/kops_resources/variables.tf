variable "ingress_ips" {
  type        = list
  description = "List of Ingress IPs"
}
variable "environment" {
  type        = string
  default     = "krypton"
  description = "Name prefix"
}
variable "vpc_id" {
  type        = string
  description = "the shared vpc id"
}
