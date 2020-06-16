provider "aws" {
  region  = "us-east-1"
}

module "route53_redirect" {
  source = "../../services/my-redirect"
  name = "meu-subdominio.${var.environment}.dominio.com.br"
  environment = "${var.environment}"
  url = "hml.com.br"
  zone_id = "${var.route53_zone_id}"
}