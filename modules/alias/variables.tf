variable "domain_name" {
  description = "your custom domain name"
  type = string
}

variable "cloudfront_domain_name" {
  type = string
}

variable "cloudfront-zone-id" {
  type = string
}

variable "hostedzone" {
  type = string
  default = "peacehouston.com"
  
}