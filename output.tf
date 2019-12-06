output "k8s-masters" {
  value = join(
    " ",
    google_compute_instance.k8s-master.*.network_interface.0.access_config.0.nat_ip,
  )
}

output "k8s-nodes" {
  value = join(
    " ",
    google_compute_instance.k8s-node.*.network_interface.0.access_config.0.nat_ip,
  )
}
