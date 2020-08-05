terraform {
  backend "s3" {
    bucket = "${bucket_name}"
    key    = "${bucket_key}"
    region = "${bucket_region}"
  }
}
