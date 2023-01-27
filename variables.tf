
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

###### EKS CLUSTER VARIABLES
variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type        = string
  default     = null
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_service_ipv4_cidr" {
    type = string
    description = "(optional) describe your variable"
    default = null
}
