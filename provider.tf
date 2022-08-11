# Configure the Opsgenie Provider
provider "opsgenie" {
  api_key = var.OPSGENIE_API_KEY
  api_url = var.OPSGENIE_API_URL         //default is api.opsgenie.com
  version = var.opsgenie_version
}
