module "s3-bucket" {
  source = "./modules/s3"
  bucket-name = var.bucket-name
}

module "certificate" {
  source = "./modules/certificate"
  domain_name = var.domain_name
  subject_alternative_names  = ["www.${var.domain_name}"]
  # validation_record_fqdns = module.route53.cert_validation_record_fqdns
  # route53_dns_records = module.route53.dns_records
  }

module "cloudfront" {
  source = "./modules/cloudfront"
  domain_name = var.domain_name
  cdn-domain_name-and-origin_id = module.s3-bucket.bucket_regional_domain_name
  acm_certificate_arn = module.certificate.cert-arn
  depends_on = [ module.route53 ]
}

module "route53" {
  source = "./modules/route53"
  domain_name = var.domain_name
  domain_validation_options = module.certificate.domain_validation_options
  certificate_arn = module.certificate.cert-arn
  # cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  # cloudfront-zone-id = module.cloudfront.cloudfront_hosted-zone_id
  # depends_on = [ module.cloudfront ]
}

module "alias" {
  source = "./modules/alias"
  domain_name = var.domain_name
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  cloudfront-zone-id = module.cloudfront.cloudfront_hosted-zone_id
  depends_on = [ module.cloudfront ]
}