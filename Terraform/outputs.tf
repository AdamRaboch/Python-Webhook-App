

output "instance_label" {
  description = "Label assigned to the Linode instance"
  value       = linode_instance.webhook_instance.label
}
