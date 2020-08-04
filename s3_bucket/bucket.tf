resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.prefix}-consul-sd"
  acl = "private"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = "aws_kms_key.dgarrison-kms-key.arn"
#         sse_algorithm     = "aws:kms"
#       }
#     }
#   }
}