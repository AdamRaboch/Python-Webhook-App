variable "linode_api_token" {
  description = "The API token for Linode"
  type        = string
  default     = "c0c8f7b82013a85e186fc58d3b1aee1dbf393a496219ea9d8df20c37fce5e912"
}

variable "instance_label" {
  description = "Label for the Linode instance"
  type        = string
  default     = "flask-webhook-instance"
}

variable "region" {
  description = "Region to deploy the instance"
  type        = string
  default     = "it-mil"
}

variable "instance_type" {
  description = "Type of the Linode instance"
  type        = string
  default     = "g6-nanode-1"
}

variable "github_repo" {
  description = "GitHub repository in the format 'owner/repo'"
  type        = string
  default     = "AdamRaboch/Python-Webhook-App" # Replace with your actual GitHub repository
}

variable "authorized_keys" {
  description = "List of SSH authorized keys"
  type        = list(string)
  default     = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIgGWO2HQOYYP661ZhW+yQmGRd2X9WXO3xRRdYugLCJd default"]
}

variable "root_pass" {
  description = "Root password hash"
  type        = string
  default     = "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAA"
}
