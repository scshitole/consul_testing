terraform {
  backend "s3" {
    bucket = "dgarrison-consul-sd"
    key    = "deploy-infrastructure"
    region = "us-east-1"
  }
}
