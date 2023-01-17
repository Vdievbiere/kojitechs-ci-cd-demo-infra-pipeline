
variable "component_name" {
    type = string
    description = "(optional) describe your variable"
    default = "ci-cd-demo"
}

variable "vpc_cidr" {
  type        = string
  description = "The value for the vpc cidr"
  default = "10.0.0.0/16"
}

variable "public_subnetcidr" {
  type        = list(any)
  description = "public subnet cidrs"
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "private_subnetcidr" {
  type        = list(any)
  description = "private subnet cidrs"
  default= ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}
