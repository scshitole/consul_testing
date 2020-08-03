resource "aws_kms_key" "kms-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.prefix}-consul-bucket"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.kms-key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}



terraform {
  backend "s3" {
    bucket = "${var.prefix}-consul-bucket"
    key    = "deploy-infrastructure"
    region = "${var.region}"
  }
}
