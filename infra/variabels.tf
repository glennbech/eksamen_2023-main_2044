variable "candidate_prefix"{
  description = "The common prefix used in resource names"
  type = string
  //default = "candidate2044" //Change this value. This value is used in multiple places
}

variable "ecr_repository"{
  description = "Your own repositorie where your image tag is created"
  type = string
  //default = "sporeb15-private" // Change this value to tour own ECR repositor
} 

variable "service_name" {
  description = "The name of the App Runner service"
  type        = string
  name     = "kjell-is-${var.candidate_prefix}"
}

variable "candidate" {
  description = "The name of the dashboard name"
  type        = string
  name     = "cloudwatch-${var.candidate_prefix}"
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
  name     = "244530008913.dkr.ecr.eu-west-1.amazonaws.com/${var.ecr_repository}:latest" 
}

variable "access_role_arn" {
  description = "The ARN of the role that App Runner will assume"
  type        = string
  default     = "arn:aws:iam::244530008913:role/service-role/AppRunnerECRAccessRole"
}

variable "role_name" {
  description = "The name of the IAM role for App Runner service"
  type        = string
  name     = "${var.candidate_prefix}-role-thingye"
}

variable "policy_name" {
  description = "The name of the IAM policy for App Runner service"
  type        = string
  name     = "${var.candidate_prefix}-apr-policy-thingy" 
}

//variable "prefix" {
//  type = string
//}

variable "image" {
  type = string
}
