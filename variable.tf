variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default     = ""
}

variable "aws_access_key" {
  description = "AKIAQGYBP336JAQQLZRX"
  type        = string
}

variable "aws_secret_key" {
  description = "3RsL94YqHeM6Wba6zFXyaMvQU/wEUtqZ+/zTIFKK"
  type        = string
  sensitive   = true
}
