locals {
    BUCKET_NAME = "${var.prefix}-consul-sd"
    KEY_NAME = "aws_kms_key.${var.prefix}-kms-key.arn"
    PREFIX = "${var.prefix}"
    REGION = "${var.region}"
}

# resource "aws_kms_key" "${local.PREFIX}-kms-key" {
#   description             = "This key is used to encrypt bucket objects"
#   deletion_window_in_days = 7
# }

resource "aws_s3_bucket" "mybucket" {
  bucket = "${local.BUCKET_NAME}"
  acl = "private"

  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       kms_master_key_id = "aws_kms_key.${local.KEY_NAME}"
  #       sse_algorithm     = "aws:kms"
  #     }
  #   }
  # }
}



terraform {
  backend "s3" {
    bucket = "dgarrison-consul-sd"
    key    = "deploy-infrastructure"
    region = "us-east-1"
  }
}