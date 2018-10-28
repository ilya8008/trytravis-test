resource "google_compute_target_pool" "reddit-app-pool" {
  name = "reddit-app-pool"

  instances = [
    "${element(google_compute_instance.app.*.self_link,0)}",
    "${element(google_compute_instance.app.*.self_link,1)}",
  ]

  health_checks = [
    "${google_compute_http_health_check.reddit-app-port.name}",
  ]
}

resource "google_compute_http_health_check" "reddit-app-port" {
  name               = "reddit-app-port"
  request_path       = "/"
  check_interval_sec = 4
  timeout_sec        = 2
  port               = "9292"
}

resource "google_compute_forwarding_rule" "reddit-app-lb" {
  name       = "reddit-app-lb"
  target     = "${google_compute_target_pool.reddit-app-pool.self_link}"
  port_range = "9292"
}
