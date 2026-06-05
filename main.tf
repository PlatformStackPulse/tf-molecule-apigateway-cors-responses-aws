# Molecule: API Gateway CORS Gateway Responses (4XX + 5XX)
# These fire when API GW itself returns errors (before Lambda executes).
# Must use '*' because Access-Control-Allow-Origin only accepts ONE origin or '*'.
# Lambda handlers dynamically reflect the actual request origin for success responses.

resource "aws_api_gateway_gateway_response" "cors_4xx" {
  count = module.this.enabled ? 1 : 0

  rest_api_id   = var.rest_api_id
  response_type = "DEFAULT_4XX"

  response_parameters = {
    "gatewayresponse.header.Access-Control-Allow-Origin"  = "'*'"
    "gatewayresponse.header.Access-Control-Allow-Headers" = "'${var.allowed_headers}'"
    "gatewayresponse.header.Access-Control-Allow-Methods" = "'${var.allowed_methods}'"
  }
}

resource "aws_api_gateway_gateway_response" "cors_5xx" {
  count = module.this.enabled ? 1 : 0

  rest_api_id   = var.rest_api_id
  response_type = "DEFAULT_5XX"

  response_parameters = {
    "gatewayresponse.header.Access-Control-Allow-Origin"  = "'*'"
    "gatewayresponse.header.Access-Control-Allow-Headers" = "'${var.allowed_headers}'"
    "gatewayresponse.header.Access-Control-Allow-Methods" = "'${var.allowed_methods}'"
  }
}
