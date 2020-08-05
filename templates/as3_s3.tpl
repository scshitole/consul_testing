terraform {
  backend "s3" {
    bucket = "${bucket_name}"
    key    = "deploy-as3"
    region = "${bucket_region}"
  }
}

data "terraform_remote_state" "consul_sd" {
   backend = "s3"
   config = {
     bucket = "${bucket_name}"
     key    = "deploy-infrastructure"
     region = "${bucket_region}"
   }
 }