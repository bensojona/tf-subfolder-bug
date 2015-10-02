# test 2
variable "name" { default = "main-folder-test" }
variable "region" { default = "us-east-1" }
variable "atlas_environment" { default = "main-folder-test" }
variable "atlas_username" { default = "jb_hashicorp" }
variable "cidr" { default = "10.139.0.0/16" }

provider "aws" {
  region = "${var.region}"
}

atlas {
  name = "${var.atlas_username}/${var.atlas_environment}"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags { Name = "${var.name}" }
}

resource "aws_security_group" "sg" {
  name        = "${var.name}"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags { Name = "${var.name}" }

  ingress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
