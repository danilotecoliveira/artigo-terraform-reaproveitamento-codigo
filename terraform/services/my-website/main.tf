resource "aws_s3_bucket" "s3_website" {
  bucket = "${var.bucket_name}"
  acl = "private"
  region = "us-east-1"
  
  website {
    index_document = "index.html"
  }
}

resource "aws_route53_record" "meu_redirecionamento" {
  zone_id = "${var.zone_id}"
  name = "${var.url_redirect}"
  type = "A"

  alias {
    name = "${aws_s3_bucket.s3_website.website_domain}"
    zone_id = "${aws_s3_bucket.s3_website.hosted_zone_id}"
    evaluate_target_health = true
  }
}