variable "account_id" {
  type        = string
  description = "The AWS account identifier"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "region" {
  type        = string
  description = "The AWS region name"
  default     = "eu-west-2"
}

variable "tags" {
  type        = map(any)
  description = "Tagging information for the resource"
  default     = {}
}
