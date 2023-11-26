variable "service_name" {
  description = "The name of the App Runner service"
  type        = string
  //default     = "kjell-is-candidate2044" // Change this default value as needed
}

variable "candidate" {
  description = "The name of the dashboard name"
  type        = string
  default     = "cloudwatch-candidate2044" // Change this default value as needed
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
  //default     = "244530008913.dkr.ecr.eu-west-1.amazonaws.com/sporeb15-private:latest" //Change this to your own repositorie where your image tag is created.
}

variable "access_role_arn" {
  description = "The ARN of the role that App Runner will assume"
  type        = string
  default     = "arn:aws:iam::244530008913:role/service-role/AppRunnerECRAccessRole"
}

variable "role_name" {
  description = "The name of the IAM role for App Runner service"
  type        = string
  default     = "candidate2044-role-thingye" // Set a default name or leave it empty to require an explicit value
}

variable "policy_name" {
  description = "The name of the IAM policy for App Runner service"
  type        = string
  default     = "candidate2044-apr-policy-thingy" // Set a default name or leave it empty to require an explicit value
}

variable "prefix" {
  type = string
}

//variable "image" {
//  type = string
//}
