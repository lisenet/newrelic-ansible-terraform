resource "newrelic_synthetics_monitor" "web_lsn" {
  name      = "www.lisenet.com_tf"
  type      = "SIMPLE"
  frequency = 5
  status    = "ENABLED"
  locations = ["AWS_EU_WEST_1", "AWS_EU_WEST_2", "AWS_AP_NORTHEAST_1", "AWS_US_EAST_1"]

  uri               = "https://www.lisenet.com" # Required for type "SIMPLE" and "BROWSER"
  validation_string = "Solutin"                 # Optional for type "SIMPLE" and "BROWSER"
  verify_ssl        = true                      # Optional for type "SIMPLE" and "BROWSER"
}
