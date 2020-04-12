# Create an AWS certificate for hello.aymen.krypton.berlin
resource "aws_acm_certificate" "cert" {
  domain_name       = aws_route53_record.hello.name
  validation_method = "DNS"

  tags = {
    Environment = "Krypton"
    Terraform   = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}
// Add HTTPS Listner to the application ELB
# Not supported for classic ELB
# resource "aws_lb_listener" "https" {
#   load_balancer_arn = data.aws_elb.lb.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = aws_acm_certificate.cert.arn

#   default_action {
#     type = "redirect"

#     redirect {
#       port     = "80"
#       protocol = "HTTP"
#       status_code = "HTTP_301"
#     }
#   }
# }
