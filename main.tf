# See https://cloud.google.com/compute/docs/load-balancing/network/example

provider "google" {
  region      = var.region
  project     = var.project_name
  credentials = file(var.credentials_file_path)
}

resource "google_compute_instance" "k8s-master" {
  count = var.k8s-master-count

  allow_stopping_for_update = true
  name                      = "k8s-master-${count.index}"
  machine_type              = "f1-micro"
  zone                      = var.region_zone
  tags                      = ["master"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20191113"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  metadata = {
    ssh-keys       = "durell:${file(var.public_key_path)}"
    startup-script = file("startup-script.sh")
    #user-data = file("cloud-init.template")
    #user-data = "${data.template_cloudinit_config.config.rendered}"
  }

  #  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq nginx; systemctl enable nginx; systemctl start nginx" 
}

resource "google_compute_instance" "k8s-node" {
  count = var.k8s-node-count

  allow_stopping_for_update = true
  name                      = "k8s-node-${count.index}"
  machine_type              = "f1-micro"
  zone                      = var.region_zone
  tags                      = ["node"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20191113"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  metadata = {
    ssh-keys       = "durell:${file(var.public_key_path)}"
    startup-script = file("startup-script.sh")
    #user-data = 
  }

  #  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq nginx; systemctl enable nginx; systemctl start nginx" 
}
