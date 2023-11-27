variable "service_name" {
  description = "The name of the App Runner service"
  type        = string
}

variable "dashboard_name" {
  description = "The name of the dashboard name"
  type        = string
}

variable "instance_cpu" {
  description = "The number of CPU units reserved for each instance of your App Runner service"
  type        = number
  default     = 1024
}

variable "instance_memory" {
  description = "The amount of memory, in MB, reserved for each instance of your App Runner service"
  type        = number
  default     = 2048
}

variable "app_port" {
  description = "The port the application is running on"
  type        = string
  default     = "8080"
}

variable "image_identifier" {
  description = "The identifier of the image in ECR"
  type        = string
}

variable "access_role_arn" {
  description = "The ARN of the role that App Runner will assume"
  type        = string
  default     = "arn:aws:iam::244530008913:role/service-role/AppRunnerECRAccessRole"
}

variable "role_name" {
  description = "The name of the IAM role for App Runner service"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy for App Runner service"
  type        = string
}

variable "prefix" {
  type = string
}

variable "alarm_email" {
  type = string
  default = "your@email.no" //Change to your own email
}
