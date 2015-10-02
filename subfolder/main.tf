# test 4
variable "name" { default = "sub-folder-test" }
variable "region" { default = "us-east-1" }
variable "atlas_environment" { default = "sub-folder-test" }
variable "atlas_username" { default = "jb_hashicorp" }
variable "cidr" { default = "10.139.0.0/16" }

provider "aws" {
  region = "${var.region}"
}

atlas {
  name = "${var.atlas_username}/${var.atlas_environment}"
}

module "networking" {
  source = "networking"

  cidr = "${var.cidr}"
  name = "${var.name}"
}
