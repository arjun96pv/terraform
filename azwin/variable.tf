variable "rg_name" {
  default = "terraform_rg"
}

variable "location" {
  default = "centralus"
}

variable "address_space" {
  default = ["10.1.0.0/16"]
  type    = list(string)
}

variable "vnet_name" {
  default = "terraform_vnet"
}
variable "subnet_space" {
  default = ["10.1.0.0/24", "10.1.10.0/24"]
  type    = list(string)
}

variable "subnet_name" {
  default = "terraform_snet"
}

variable "key" {
  default = "ssh_key"
}

variable "nic_name" {
  default = "nic"
}
variable "pip_name" {
  default = "pip"
}

variable "ip_name" {
  default = "ip"
}
variable "sku" {
  default = "22.04-LTS"
}
variable "vm_name" {
  default = "vm"
}
variable "admin" {
  default = "azureuser"
}
variable "size" {
  default = "Standard_DS1_v2"
}
variable "user" {
  default = "azureuser"
}
variable "nsg" {
  default = "nsg"
}
variable "vmname1" {
  default = "winmachine"
}
variable "vm_size1" {
  default = "Standard_B2s"
}
variable "nic1" {
  default = "nic-win"
}
~

