terraform {
  backend "s3" {
    bucket = "dgarrison-consul-sd"
    key    = "deploy-as3"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

data "terraform_remote_state" "consul_sd" {
   backend = "s3"
   config = {
     bucket = "dgarrison-consul-sd"
     key    = "deploy-infrastructure"
     region = "us-east-1"
   }
 }
