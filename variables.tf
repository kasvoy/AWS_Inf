variable "region" {
  type        = string
  description = "The AWS Region to use"

}

variable "vpc_cidr" {
  type        = string
  description = "AWS VPC CIDR range"
}

variable "availability_zone_names" {
  type        = list(string)
  description = "list of subnet availability zones"
}