variable "ssh_config" {
  type        = string
  default     = "~/.ssh/config"
  description = "Your ssh configuration to edit"
}

variable "update_ssh_config_enable" {
  type        = string
  default     = ""
  description = "Will enable this module if set to something other than empty"
}

variable "cmd" {
  type        = string
  default     = "addhost"
  description = "Which command to use, supported: addhost, remove"
}

variable "shorthosts" {
  type        = string
  default     = "kdevops-ignore-demo-host"
  description = "Comma separated names identifying the target host to work on"
}

variable "hostnames" {
  type        = string
  default     = ""
  description = "Comma separated hostnames or IP addresses representing the shorthosts"
}

variable "ports" {
  type        = string
  default     = ""
  description = "Comma separated ports or to use for each shorthost"
}

variable "user" {
  type        = string
  default     = ""
  description = "Username to use"
}

variable "id" {
  type        = string
  default     = ""
  description = "ssh identity file to use for this host, the ssh pubkey name"
}

variable "strict" {
  type        = string
  default     = ""
  description = "If set to true we'll use strict host settings"
}

variable "use_backup" {
  type        = string
  default     = ""
  description = "If set to true we'll use backup your ssh config"
}

variable "backup_postfix" {
  type        = string
  default     = "kdevops_module"
  description = "The postfix to use for the backup file for your ssh config"
}
