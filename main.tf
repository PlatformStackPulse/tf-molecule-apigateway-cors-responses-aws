# Molecule: API Gateway CORS Gateway Responses (4XX + 5XX)

resource "aws_api_gateway_gateway_response" "cors_4xx" {
  count = module.this.enabled ? 1 : 0

  rest_api_id   = var.rest_api_id
  response_type = "DEFAULT_4XX"

  response_parameters = {
    "gatewayresponse.header.Access-Control-Allow-Origin"  = "'${var.allowed_origin}'"
    "gatewayresponse.header.Access-Control-Allow-Headers" = "'${var.allowed_headers}'"
    "gatewayresponse.header.Access-Control-Allow-Methods" = "'${var.allowed_methods}'"
  }
}

resource "aws_api_gateway_gateway_response" "cors_5xx" {
  count = module.this.enabled ? 1 : 0

  rest_api_id   = var.rest_api_id
  response_type = "DEFAULT_5XX"

  response_parameters = {
    "gatewayresponse.header.Access-Control-Allow-Origin"  = "'${var.allowed_origin}'"
    "gatewayresponse.header.Access-Control-Allow-Headers" = "'${var.allowed_headers}'"
    "gatewayresponse.header.Access-Control-Allow-Methods" = "'${var.allowed_methods}'"
  }
}
