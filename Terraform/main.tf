terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.25.0"
    }
  }
}

provider "linode" {
  token = var.linode_api_token
}

resource "linode_instance" "webhook_instance" {
  label           = var.instance_label
  region          = var.region
  type            = var.instance_type
  image           = "linode/centos-stream9"
  authorized_keys = var.authorized_keys
  root_pass       = var.root_pass
}

# Output the Linode instance's IP address
output "instance_ip" {
  value = linode_instance.webhook_instance.ip_address
}
