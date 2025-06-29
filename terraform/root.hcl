locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  account_id   = local.account_vars.inputs.account_id
  environment  = local.account_vars.inputs.environment
  identifier   = lower("tf-state-${local.account_id}-${local.environment}")
}

inputs = {
  account_id  = local.account_id
  environment = local.environment
  identifier  = local.identifier
}

remote_state {
  backend = "s3"

  generate = {
    path      = "state.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket         = local.identifier
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = local.identifier
    region         = "eu-west-2"
    encrypt        = true
  }
}
