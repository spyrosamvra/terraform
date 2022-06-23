# resource "hcloud_firewall" "web-servers-firewall" {
#   count = length(var.firewall_rules_names)
#   name  = var.firewall_rules_names[count.index]
#   rule {
#     direction = var.firewall_direction
#     protocol  = var.firewall_protocol
#     port      = var.firewall_port[count.index]
#     source_ips = [
#       "0.0.0.0/0",
#       "::/0"
#     ]
#   }
# }
