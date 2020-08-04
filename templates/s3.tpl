data "template_file" "s3" {
  template = file("s3.tpl")
  vars = {
    bucket_name = "${var.prefix}-consul-sd"
    bucket_key = "deploy-infrastructure"
    bucket_region = "${var.region}"
  }
}

resource "null_resource" "export_rendered_template" {
  provisioner "local-exec" {
    command = "cat > ../terraform/s3.tf <<EOL\n${data.template_file.s3.rendered}\nEOL"
  }
}