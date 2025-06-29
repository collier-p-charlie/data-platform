# Terraform

We use [**terragrunt**](https://terragrunt.gruntwork.io) to keep the _terraform_ configuration **DRY** and reduce _variable usage redundancies_.


## Bootstrap

Ensure that an **S3** bucket (which is _versioned_) and **DynamoDB** table (with _partition key_ called `LockID`) are setup with the name `tf-state-${ACCOUNT_ID}-${ENV}` before deploying any **terraform**.
We can then run the `terragrunt init` to initialise the project with the backend configuration in `root.hcl`.


## Deploying

We can use `terragrunt plan` on a `.hcl` file to plan the run.


## Formatting

We can run the `terraform fmt` and `terragrunt hcl fmt` to format any new code.
