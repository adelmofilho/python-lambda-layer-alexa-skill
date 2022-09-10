variable "python_version" {
  type = string
}

variable "layer_name" {
  type = string
  default = "alexa_skill_python_minimal"
}

variable "statement_id" {
  type    = string
  default = "alexa_skill_python_minimal"
}

# variable "compatible_architectures" {
#   type    = string
#   default = "x86_64"
# }

variable "description" {
  type    = string
  default = "Python Lambda Layer with minimal packages for alex skills"
}

variable "license_info" {
  type    = string
  default = "MIT"
}
