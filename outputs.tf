output "prod_lb_hostname" {
  value = aws_lb.prod.dns_name
}