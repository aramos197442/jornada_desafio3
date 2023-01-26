data "digitalocean_ssh_key" "my_key" {
  name = "Jornada"
}

resource "digitalocean_droplet" "my_jenkins" {
  image    = var.image
  name     = var.name
  region   = var.region
  size     = var.size
  ssh_keys = [data.digitalocean_ssh_key.my_key.id]

}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.k8s_name
  region  = var.k8s_region
  version = var.k8s_version

  node_pool {
    name       = var.pool_name
    size       = var.pool_size
    node_count = var.pool_node_count

  }
}