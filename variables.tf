variable "cluster_id" {
    type        = string
    description = "Cluster ID"
}

variable "subnet_ids" {
    type        = list(string) 
    description = "List of subnet Ids"
}

variable "name" {
    type        = string
    description = "Name of the group"
    default     = "workers"
}

variable "k8s_version" {
    type        = string
    description = "k8s version"
    default     = "1.21"
}

variable "memory" {
    type        = number
    description = "Memory size in Gb"
    default     = 2
}

variable "cores" {
    type        = number
    description = "Number of cores"
    default     = 2
}

variable "nodes" {
    type        = number
    description = "Number of nodes"
    default     = 3
}

variable "disk_size" {
    type        = number
    description = "Disk size in Gb"
    default     = 30
}
