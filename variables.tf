variable "region" {
  default = "us-central1"
}

variable "region_zone" {
  default = "us-central1-f"
}

variable "project_name" {
  default = "kube-cluster-259423"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/kube-cluster-259423-96f6affa8a28.json"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/gcloud_id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.ssh/gcloud_id_rsa"
}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}

variable "k8s-master-count" {
  description = "Number of k8s master hosts to provision"
  default     = 1
}

variable "k8s-node-count" {
  description = "Number of k8s node hosts to provision"
  default     = 0
}

variable "ansible-inventory" {
  description = "Location of the ansible inventory to be created"
  default     = "ansible/hosts"
}
