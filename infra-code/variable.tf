variable "aws_region" {
  default = "us-east-1"
}

variable "ami" {}
variable "instance_type" {
  default = "t3.medium"
}

variable "subnet_id" {}
variable "vpc_id" {}

variable "key_name" {}
variable "public_key_path" {}
variable "private_key_path" {}

variable "s3_bucket_name" {
  default = "qacetech-terraform-state"
}

variable "dynamodb_table_name" {
  default = "qacetech-terraform-locks"
}
