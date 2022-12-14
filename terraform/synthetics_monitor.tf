resource "newrelic_synthetics_monitor" "main" {
  name      = "${var.website_fqdn_to_monitor}_tf"
  type      = "SIMPLE"
  period    = "EVERY_5_MINUTES"
  status    = "ENABLED"
  locations_public = ["EU_WEST_1", "EU_WEST_2", "AP_NORTHEAST_1", "US_EAST_1"]

  uri               = "https://${var.website_fqdn_to_monitor}" # Required for type "SIMPLE" and "BROWSER"
  validation_string = "Solutin"                 # Optional for type "SIMPLE" and "BROWSER"
  verify_ssl        = true                      # Optional for type "SIMPLE" and "BROWSER"
}
