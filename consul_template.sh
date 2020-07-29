#!/bin/bash

sudo rm -rf consul_template

#Utils
sudo apt-get install unzip -y

#Download Consul
CONSUL_TEMPLATE_VERSION="0.25.1"
curl --silent --remote-name https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
curl --silent --remote-name https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip

#Install Consul
sudo unzip -o consul_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip
sudo chown root:root consul_template
sudo mv consul /usr/local/bin/

# #Create Consul User
# sudo useradd --system --home /etc/consul.d --shell /bin/false consul
# sudo mkdir --parents /opt/consul
# sudo chown --recursive consul:consul /opt/consul

# #Create config dir
# sudo mkdir --parents /etc/consul.d
# sudo touch /etc/consul.d/consul.hcl
# sudo chown --recursive consul:consul /etc/consul.d
# sudo chmod 640 /etc/consul.d/consul.hcl

# cat << EOF > /etc/consul.d/consul.hcl
# datacenter = "UDF"
# data_dir = "/opt/consul"

# EOF

# cat << EOF > /etc/consul.d/server.hcl
# server = false
# bootstrap_expect = 1
# client_addr = "0.0.0.0"
# EOF

