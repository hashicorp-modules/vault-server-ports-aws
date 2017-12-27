module "vault_server_ports_aws" {
  source = "../../../vault-server-ports-aws"
  # source = "git@github.com:hashicorp-modules/vault-server-ports-aws?ref=f-refactor"

  count       = "0"
  vpc_id      = "1234"
  cidr_blocks = ["10.139.0.0/16"]
}
