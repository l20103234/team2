variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default     = ""
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}
