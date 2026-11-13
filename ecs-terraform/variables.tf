variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "myapp"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "container_port" {
  description = "Application container port"
  type        = number
  default     = 8080
}

variable "container_cpu" {
  type    = number
  default = 512
}

variable "container_memory" {
  type    = number
  default = 1024
}

variable "desired_count" {
  type    = number
  default = 2
}