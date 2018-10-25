output "app_external_ip" {
  value = "${element(google_compute_instance.app.*.network_interface.0.access_config.0.assigned_nat_ip,0)}"
}

output "app_external_ip1" {
  value = "${element(google_compute_instance.app.*.network_interface.0.access_config.0.assigned_nat_ip,1)}"
}

output "app_lb_external_ip" {
  value = "${google_compute_forwarding_rule.reddit-app-lb.ip_address}"
}
