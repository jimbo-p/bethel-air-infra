variable "application-name" {
  type = string
  default = "bethel-air"
  
}

variable "domain_name" {
  type    = string
  default = "dev.peacehouston.com"
}

variable "environment" {
  type = string
  default = "dev"
  
}

variable "region" {
  type    = string
  default = "us-east-1"
}
variable "hostedzone" {
  type = string
  default = "peacehouston.com"
  
}