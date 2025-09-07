variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "desafio-eks"
}

variable "cluster_version" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "node_desired" {
  type = number
}

variable "node_min" {
  type = number
}

variable "node_max" {
  type = number
}

variable "node_instance_types" {
  type = list(string)
}

variable "iam_username" {
  type = string
}
