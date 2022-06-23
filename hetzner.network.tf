resource "hcloud_network" "core" {
  name     = var.network_name
  ip_range = var.network_range
}
resource "hcloud_network_subnet" "subnet" {
  count        = length(var.network_subnets_ranges)
  network_id   = hcloud_network.core.id
  type         = var.network_type
  network_zone = var.network_zone
  ip_range     = var.network_subnets_ranges[count.index]
  depends_on = [
    hcloud_network.core
  ]
}
