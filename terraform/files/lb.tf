resource "google_compute_target_pool" "default" {
  name          = "reddit-target-pool"
  instances     = google_compute_instance.app.*.self_link
  health_checks = [google_compute_http_health_check.default.name]
}
resource "google_compute_forwarding_rule" "default" {
  name       = "reddit-forwarding-rule"
  port_range = "9292"
  target     = google_compute_target_pool.default.self_link
}
resource "google_compute_http_health_check" "default" {
  name               = "reddit-healthcheck"
  port               = 9292
  check_interval_sec = 1
  timeout_sec        = 1
}