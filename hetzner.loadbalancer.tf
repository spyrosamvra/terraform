resource "hcloud_load_balancer" "loadbalancers" {
  count              = length(local.lb_names)
  name               = local.lb_names[count.index]
  load_balancer_type = var.lb_type
  location           = data.hcloud_datacenter.datacenter.id
}

resource "hcloud_load_balancer_network" "loadbalancers" {
  count                   = length(local.lb_names)
  load_balancer_id        = hcloud_load_balancer.loadbalancers[count.index].id
  network_id              = hcloud_network_subnet.subnet[hcloud_load_balancer.loadbalancers[count.index].name == local.lb_names[1] ? 3 : 0].network_id
  ip                      = var.lb_ips[hcloud_load_balancer.loadbalancers[count.index].name == local.lb_names[1] ? 1 : 0]
  enable_public_interface = hcloud_load_balancer.loadbalancers[count.index].name == local.lb_names[1] ? false : true
  depends_on = [
    hcloud_network_subnet.subnet
  ]
}

resource "hcloud_load_balancer_target" "load_balancer_target" {
  count            = length(local.lb_names)
  type             = var.lb_selector_type
  load_balancer_id = hcloud_load_balancer.loadbalancers[count.index].id
  label_selector   = var.lb_selector[hcloud_load_balancer.loadbalancers[count.index].name == local.lb_names[1] ? 1 : 0]
  depends_on = [
    hcloud_load_balancer.loadbalancers
  ]
}

resource "hcloud_load_balancer_service" "load_balancer_public_services" {
  count            = length(var.lb_public_listen_ports)
  load_balancer_id = hcloud_load_balancer.loadbalancers[0].id
  protocol         = var.lb_ptotocol
  listen_port      = var.lb_public_listen_ports[count.index]
  destination_port = var.lb_public_destination_ports[count.index]
  depends_on = [
    hcloud_load_balancer.loadbalancers[0]
  ]
}

resource "hcloud_load_balancer_service" "load_balancer_internal_services" {
  count            = length(var.lb_internal_listen_ports)
  load_balancer_id = hcloud_load_balancer.loadbalancers[1].id
  protocol         = var.lb_ptotocol
  listen_port      = var.lb_internal_listen_ports[count.index]
  destination_port = var.lb_internal_destination_ports[count.index]
  depends_on = [
    hcloud_load_balancer.loadbalancers[1]
  ]
}
