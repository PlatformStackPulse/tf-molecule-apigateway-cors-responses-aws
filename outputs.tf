output "cors_4xx_id" {
  description = "ID of the 4XX CORS gateway response"
  value       = try(aws_api_gateway_gateway_response.cors_4xx[0].id, "")
}

output "cors_5xx_id" {
  description = "ID of the 5XX CORS gateway response"
  value       = try(aws_api_gateway_gateway_response.cors_5xx[0].id, "")
}
