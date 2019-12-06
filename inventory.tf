resource "null_resource" "ansible-provision" {

  depends_on = [google_compute_instance.k8s-master]
  #depends_on = ["google_compute_instance.k8s-master", "google_compute_instance.k8s-node"]

  ##Create Masters Inventory
  provisioner "local-exec" {
    command = "echo \"[k8s-masters]\" > ${(var.ansible-inventory)}"
  }

  provisioner "local-exec" {
    #command =  "echo \"\n${join("\n",formatlist("%s ansible_ssh_host=%s", google_compute_instance.k8s-master.*.tags.Name, google_compute_instance.k8s-master.*.network_interface.0.access_config.0.nat_ip))}\" >> ${(var.ansible-inventory)}"
    command =  "echo \"${join("\n", google_compute_instance.k8s-master.*.network_interface.0.access_config.0.nat_ip)}\n\" >> ${(var.ansible-inventory)}"
  }

  provisioner "local-exec" {
    command = "echo \"\n[k8s-deploy-host]\" >> ${(var.ansible-inventory)}"
  }

  provisioner "local-exec" {
    command = "echo \"k8s-master-0\" >> ${(var.ansible-inventory)}"
  }
}
