# Data source dns zone
data "aws_route53_zone" "zone" {
  name         = var.zone_name
}

# The Application public LB created by the K8S deployment in /k8s-deployment
data "aws_elb" "lb" {
  name = var.k8s_app_lb_name
}

# Create hello.aymen.krypton.berlin route53 record
resource "aws_route53_record" "hello" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "hello.${data.aws_route53_zone.zone.name}"
  type    = "CNAME"
  ttl     = "300"
  records = [data.aws_elb.lb.dns_name]
}
