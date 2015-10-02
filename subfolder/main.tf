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

module "networking-one" {
  source = "networking"

  cidr = "${var.cidr}"
  name = "${var.name}-one"
}

module "networking-two" {
  # source = "../networking" # Relative path doesn't work with Atlas/GitHub integration
  source = "github.com/bensojona/tf-subfolder-bug/networking" # Works with Atlas/GitHub integration

  cidr = "${var.cidr}"
  name = "${var.name}-two"
}
