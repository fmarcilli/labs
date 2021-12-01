variable project_name {
  type = string
  description = "Project Name"
}

variable environment {
  type = string
  description = "Environment"
}

variable location {
  type = string
  description = "Resource Location"
}

variable rg_name {
  type = string
  description = "Resource Location"
}

# variable sto-count {
#   type = string
#   description = "numbers storage account"
# }

variable var.storages {
  type = map(object({
    name = string
  ))}
  
  default = {
    "first" = {
      name = fiststo
    }

     "second" = {
      name = secondsto
    }
  }