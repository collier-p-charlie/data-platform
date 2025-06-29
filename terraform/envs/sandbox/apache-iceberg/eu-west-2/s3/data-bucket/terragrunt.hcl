terraform {
  source = "${local.source}/aws/s3"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "project" {
  path   = find_in_parent_folders("project.hcl")
  expose = true
}

include "account" {
  path   = find_in_parent_folders("account.hcl")
  expose = true
}

include "region" {
  path   = find_in_parent_folders("region.hcl")
  expose = true
}

locals {
  source       = "${get_repo_root()}/terraform/modules"
  region       = include.region.inputs.region
  env          = include.account.inputs.environment
  project_name = include.project.inputs.project_name
  bucket_name  = "${local.project_name}-${local.env}-data-bucket"
}

inputs = {
  bucket_name = local.bucket_name
  versioning  = "Enabled"
  region      = local.region
}
