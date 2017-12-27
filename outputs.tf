output "vault_server_sg_id" {
  value = "${aws_security_group.vault_server.*.id}"
}
