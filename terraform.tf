terraform {
  backend "s3" {
    bucket = "luciferous-hidemy-name-prox-bucketterraformstates-1r2mrb5ix8t4q"
    key    = "layers/terraform.tfstate"
    region = "ap-northeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
  }
}

variable "ARTIFACT_BUCKET" {
  type = string
}

locals {
  s3_prefix        = "layers"
  parameter_prefix = "/LuciferousHidemyNameProxy/Layer"
}

module "base" {
  source = "./modules/layer"

  s3_bucket        = var.ARTIFACT_BUCKET
  s3_key_prefix    = local.s3_prefix
  source_directory = "layers/base"
  parameter_name   = "${local.parameter_prefix}/Base"
}