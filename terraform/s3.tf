 terraform {
  backend "s3" {
    bucket = "scsft-consul-sd"
    key    = "deploy-infrastructure"
    region = "us-east-1"
  }
}

