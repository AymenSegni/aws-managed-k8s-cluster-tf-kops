variable "k8s_app_lb_name" {
  type        = string
  description = "the K8S app public LB"
}
variable "zone_name" {
  type        = string
  default     = "aymen.krypton.berlin."
  description = "Main zone name"
}
