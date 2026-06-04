variable "rest_api_id" {
  description = "ID of the REST API"
  type        = string
}

variable "allowed_origin" {
  description = "Allowed CORS origin"
  type        = string
  default     = "*"
}

variable "allowed_headers" {
  description = "Allowed CORS headers"
  type        = string
  default     = "Content-Type,Authorization,X-Amz-Date,X-Api-Key"
}

variable "allowed_methods" {
  description = "Allowed CORS methods"
  type        = string
  default     = "GET,POST,PUT,DELETE,OPTIONS"
}
