# https://www.consul.io/docs/agent/options.html#ports
resource "aws_security_group" "vault_server" {
  count = "${var.provision == "true" ? 1 : 0}"

  name        = "${var.name}"
  description = "Security Group for ${var.name} Vault"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "${var.name}"
  }
}

# Default listen port for UI and API connectivity.
resource "aws_security_group_rule" "vault_client_traffic" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${aws_security_group.vault_server.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 8200
  to_port           = 8200
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# Default listen port for server to server requests within a cluster. Also required for cluster to cluster replication traffic.
resource "aws_security_group_rule" "vault_cluster_traffic" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${aws_security_group.vault_server.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 8201
  to_port           = 8201
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# All outbound traffic - TCP.
resource "aws_security_group_rule" "outbound_tcp" {
  count = "${var.provision == "true" ? 1 : 0}"

  security_group_id = "${aws_security_group.vault_server.id}"
  type              = "egress"
  protocol          = "tcp"
  from_port         = 0
  to_port           = 65535
  cidr_blocks       = ["0.0.0.0/0"]
}
