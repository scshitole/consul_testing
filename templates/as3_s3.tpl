terraform {
  backend "s3" {
    bucket = "${prefix}-consul-sd"
    key    = "deploy-as3"
    region = "${region}"
  }
}

data "terraform_remote_state" "consul_sd" {
   backend = "s3"
   config = {
     bucket = "${prefix}-consul-sd"
     key    = "deploy-infrastructure"
     region = "${region}"
   }
 }