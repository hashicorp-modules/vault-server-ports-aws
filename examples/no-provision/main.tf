module "vault_server_ports_aws" {
  # source = "github.com/hashicorp-modules/vault-server-ports-aws"
  source = "../../../vault-server-ports-aws"

  create      = false
  vpc_id      = "1234"
  cidr_blocks = ["10.139.0.0/16"]
}
