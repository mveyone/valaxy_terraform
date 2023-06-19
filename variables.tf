variable "region" {
  type = string
  default = "us-east-1"
}

variable "ami" {
  type=string
  default = "ami-053b0d53c279acc90"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_1_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_az" {
  type = string
  default = "us-east-1e"
}