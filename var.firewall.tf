variable "firewall_direction" {
  type        = string
  description = "firewalls direction [in or out]"
  default     = "in"
}

variable "firewall_protocol" {
  type        = string
  description = "firewalls protocol"
  default     = "tcp"
}

variable "firewall_port" {
  type        = list(string)
  description = "Firewall Ports rules"
  default     = ["80", "22", "443", "16443"]
}

variable "firewall_rules_names" {
  type        = list(string)
  description = "Firewall rules names"
  default     = ["http", "ssh", "https", "apiserver"]
}
