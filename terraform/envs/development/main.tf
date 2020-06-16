provider "aws" {
  region  = "us-east-1"
}

module "my-redirect" {
  source = "../../services/my-redirect"
  bucket_name = "meu-subdominio.${var.environment}.dominio.com.br"
  environment = "${var.environment}"
  url = "dev.com.br"
  zone_id = "${var.route53_zone_id}"
}