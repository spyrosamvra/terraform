locals {
  lb_names = ["${var.lb_public}", "${var.lb_internal}"]

}

variable "lb_type" {
  type        = string
  description = "Loadbalancer type"
  default     = "lb11"
}

variable "lb_selector_type" {
  type        = string
  description = "Loadbalancer selector type"
  default     = "label_selector"
}

variable "lb_public" {
  type        = string
  description = "Loadbalancer name for apiserver and internal access via web"
  default     = "ingress"
}

variable "lb_internal" {
  type        = string
  description = "Loadbalancer name for internal storage balancing"
  default     = "storage"
}

variable "lb_ips" {
  type        = list(string)
  description = "Loadbalancers internal IPs"
  default     = ["10.0.0.100", "10.0.3.100"]
}

variable "lb_selector" {
  type        = list(string)
  description = "Label selector for loadbalancers"
  default     = ["type=master", "type=nfs"]
}

variable "lb_ptotocol" {
  type        = string
  description = "Loadbalancer traffic protocol"
  default     = "tcp"
}

variable "lb_public_listen_ports" {
  type        = list(string)
  description = "Loadbalancer public listen ports"
  default     = ["80", "443", "16443"]
}

variable "lb_public_destination_ports" {
  type        = list(string)
  description = "Loadbalancer public destinations ports"
  default     = ["80", "443", "16443"]
}

variable "lb_internal_listen_ports" {
  type        = list(string)
  description = "Loadbalancer internal storage listen ports"
  default     = ["2000", "1000"]
}

variable "lb_internal_destination_ports" {
  type        = list(string)
  description = "Loadbalancer internal storage destinations ports"
  default     = ["2000", "1000"]
}
