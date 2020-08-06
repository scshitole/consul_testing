 terraform {
  backend "s3" {
    bucket = "scsft-consul-sd"
    key    = "deploy-as3"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "consul_sd" {
   backend = "s3"
   config = {
     bucket = "scsft-consul-sd"
     key    = "deploy-infrastructure"
     region = "us-east-1"
   }
 }
