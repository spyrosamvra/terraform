variable "dc_location" {
  type        = string
  description = "Hetzner datacenter location etc Helnsinki"
  default     = "hel1-dc2"
}

data "hcloud_datacenter" "datacenter" {
  name = var.dc_location
}
