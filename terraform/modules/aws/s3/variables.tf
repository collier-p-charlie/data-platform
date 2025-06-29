variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
  validation {
    # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
    condition = (
      can(regex("^[a-z0-9][a-z0-9-.]{1,61}[a-z0-9]$", var.bucket_name)) &&
      !strcontains(var.bucket_name, "..") &&
      !startswith(var.bucket_name, "xn--") &&
      !startswith(var.bucket_name, "sthree-") &&
      !startswith(var.bucket_name, "amzn-s3-demo-") &&
      !endswith(var.bucket_name, "-s3alias") &&
      !endswith(var.bucket_name, "--ol-s3") &&
      !endswith(var.bucket_name, ".mrap") &&
      !endswith(var.bucket_name, "--x-s3") &&
      !endswith(var.bucket_name, "--table-s3")
    )
    error_message = "Invalid S3 bucket name"
  }
}

variable "versioning" {
  type        = string
  description = "Configures the versioning of the bucket"
  default     = "Enabled"
  validation {
    condition     = contains(["Enabled", "Disabled", "Suspended"], var.versioning)
    error_message = "Unsupported S3 versioning requested"
  }
}
