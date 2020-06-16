provider "aws" {
  region  = "us-east-1"
}

module "my-website" {
  source = "../../services/my-website"
  bucket_name = "${var.environment}.dominio.com.br"
  url_redirect = "dominio.com.br."
  zone_id = "${var.route53_zone_id}"
}