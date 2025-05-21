variable "vpc_cidr" {
type = string
}

variable "vpc_enable_dns_hostname" {
type = bool
}

variable "vpc_name" {
type = string
}

variable "igw" {
type = string
}

variable "pubsub_cidr" {
type = string
}

variable "map_pub_ip" {
type = bool
}

variable "pubsub_name" {
type = string
}

variable "privsub_cidr" {
type = string
}

variable "privsub_name" {
type = string
}

variable "pub_rt_name" {
type = string
}

variable "priv_rt_name" {
type = string   
}

variable "sg_name" {
type = string   
}