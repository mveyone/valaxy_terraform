variable "region" {
  type = string
  default = "us-east-1"
}

variable "ami" {
  type=string
  default = "ami-053b0d53c279acc90"
}

variable "vpc_cidr" {
    default = "10.10.0.0/16"
}

variable "subnet_1_cidr" {
 
  default = "10.10.1.0/24"
}

variable "subnet_az" {
  type = string
  default = "us-east-1a"
}