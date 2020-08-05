provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.prefix}-consul-sd"
  acl = "private"
  force_destroy = true
}

data "template_file" "s3" {
  template = file("../templates/s3.tpl")
  vars = {
    bucket_name = "${var.prefix}-consul-sd"
    bucket_key = "deploy-infrastructure"
    bucket_region = "${var.region}"
  }
}

resource "null_resource" "export_rendered_s3_template" {
  provisioner "local-exec" {
    command = "cat > ../terraform/s3.tf << EOL\n ${data.template_file.s3.rendered}\nEOL"
  }
}

data "template_file" "as3_s3" {
  template = file("../templates/as3_s3.tpl")
  vars = {
    bucket_name = "${var.prefix}-consul-sd"
    bucket_key = "deploy-as3"
    bucket_region = "${var.region}"
  }
}

resource "null_resource" "export_rendered_as3_s3_template" {
  provisioner "local-exec" {
    command = "cat > ../as3/bucket.tf << EOL\n ${data.template_file.as3_s3.rendered}\nEOL"
  }
}

data "template_file" "s3_values" {
  template = file("../templates/s3_values.tpl")
  vars = {
    bucket_name = "${var.prefix}-consul-sd"
    bucket_key = "deploy-infrastructure"
    bucket_region = "${var.region}"
  }
}

resource "null_resource" "export_rendered_template" {
  provisioner "local-exec" {
    command = "cat > s3_bucket_params.json << EOL\n ${data.template_file.s3_values.rendered}\nEOL"
  }
}
