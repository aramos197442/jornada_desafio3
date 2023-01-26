variable "do_token" {
  type = string
}
variable "image" {
  type = string
}
variable "name" {
  type = string
}
variable "region" {
  type = string
}
variable "size" {
  type = string
}

variable "k8s_name" {
  type = string
}
variable "k8s_region" {
  type = string
}
variable "k8s_version" {
  type = string
}

variable "pool_name" {
  type = string
}
variable "pool_size" {
  type = string
}
variable "pool_node_count" {
  type = number
}


output "jenkins_ip" {
  value = digitalocean_droplet.my_jenkins.ipv4_address
}

resource "local_file" "foo" {
  content = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
  filename = "kube_config.yaml"
}