variable "ami_id" {
  description = "The ID of the AMI to use for EC2 instances"
  type        = string
  default     = "ami-0cf10cdf9fcd62d37"  
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t3.micro"  
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "The AWS region"
  default     = "ap-south-1"
}

variable "aws_access_key" {
  description = "The AWS access key"
  default     = ""
}

variable "aws_secret_key" {
  description = "The AWS secret key"
  default     = ""
}

variable "aws_token" {
  description = "The AWS token"
  default     = ""
}

