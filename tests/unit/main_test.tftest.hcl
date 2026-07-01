# Unit Tests — tf-molecule-apigateway-cors-responses-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# Assertions target plan-KNOWN values only (tf-label id, resource counts,
# input pass-throughs) — never computed arn/id which are unknown under a mock.
#
# Run with:      terraform test -test-directory=tests/unit
# Run verbose:   terraform test -test-directory=tests/unit -verbose

mock_provider "aws" {}

variables {
  # tf-label identity
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # module-specific required input
  rest_api_id = "abc123xyz"
}

# ---------------------------------------------------------------------------
# Test: enabled (default) creates both gateway responses
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = module.this.id == "eg-test-thing"
    error_message = "tf-label id should be 'eg-test-thing'"
  }

  assert {
    condition     = length(aws_api_gateway_gateway_response.cors_4xx) == 1
    error_message = "Expected exactly one 4XX gateway response when enabled"
  }

  assert {
    condition     = length(aws_api_gateway_gateway_response.cors_5xx) == 1
    error_message = "Expected exactly one 5XX gateway response when enabled"
  }

  assert {
    condition     = aws_api_gateway_gateway_response.cors_4xx[0].rest_api_id == "abc123xyz"
    error_message = "4XX gateway response should attach to the provided rest_api_id"
  }

  assert {
    condition     = aws_api_gateway_gateway_response.cors_4xx[0].response_type == "DEFAULT_4XX"
    error_message = "4XX gateway response must use response_type DEFAULT_4XX"
  }

  assert {
    condition     = aws_api_gateway_gateway_response.cors_5xx[0].response_type == "DEFAULT_5XX"
    error_message = "5XX gateway response must use response_type DEFAULT_5XX"
  }
}

# ---------------------------------------------------------------------------
# Test: disabled creates nothing
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = length(aws_api_gateway_gateway_response.cors_4xx) == 0
    error_message = "No 4XX gateway response should be created when enabled = false"
  }

  assert {
    condition     = length(aws_api_gateway_gateway_response.cors_5xx) == 0
    error_message = "No 5XX gateway response should be created when enabled = false"
  }
}
