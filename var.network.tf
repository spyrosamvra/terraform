variable "network_enable" {
  type        = bool
  description = "Enable Network Autobuilder"
  default     = true
}
variable "network_type" {
  type        = string
  description = "Network type etc Cloud"
  default     = "cloud"
}
variable "network_zone" {
  type        = string
  description = "Network zone etc eu-east"
  default     = "eu-central"
}
variable "network_name" {
  type        = string
  description = "Network name"
  default     = "core"
}
variable "network_range" {
  type        = string
  description = "Network range"
  default     = "10.0.0.0/16"
}
variable "network_subnets_ranges" {
  type        = list(string)
  description = "Network zone etc eu-east"
  default = [
    "10.0.0.0/24",
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}
