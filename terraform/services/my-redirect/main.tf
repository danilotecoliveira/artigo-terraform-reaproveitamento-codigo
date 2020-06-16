resource "aws_s3_bucket" "meu_bucket_s3" {
  bucket = "${var.bucket_name}"
  acl = "private"
  region = "us-east-1"
  
  website {
    index_document = "index.html"
  }
}

resource "aws_route53_record" "meu_redirecionamento" {
  zone_id = "${var.zone_id}"
  name = "meu-subdominio.${var.environment}.dominio.com.br."
  type = "A"

  alias {
    name = "${aws_s3_bucket.meu_bucket_s3.website_domain}"
    zone_id = "${aws_s3_bucket.meu_bucket_s3.hosted_zone_id}"
    evaluate_target_health = true
  }
}