//--------------------------------------------------------------------
// Variables
variable "compute_admin_password" {}
variable "compute_admin_username" {}
variable "compute_boot_diagnostics" {}
variable "compute_boot_diagnostics_sa_type" {}
variable "compute_data_disk" {}
variable "compute_data_disk_size_gb" {}
variable "compute_data_sa_type" {}
variable "compute_delete_os_disk_on_termination" {}
variable "compute_is_windows_image" {}
variable "compute_nb_instances" {}
variable "compute_nb_public_ip" {}
variable "compute_public_ip_address_allocation" {}
variable "compute_public_ip_dns" {}
variable "compute_remote_port" {}
variable "compute_resource_group_name" {}
variable "compute_ssh_key" {}
variable "compute_storage_account_type" {}
variable "compute_tags" {}
variable "compute_vm_hostname" {}
variable "compute_vm_os_id" {}
variable "compute_vm_os_offer" {}
variable "compute_vm_os_publisher" {}
variable "compute_vm_os_simple" {}
variable "compute_vm_os_sku" {}
variable "compute_vm_os_version" {}
variable "compute_vm_size" {}
variable "compute_vnet_subnet_id" {}
variable "vnet_nsg_ids" {}
variable "vnet_subnet_names" {}
variable "vnet_subnet_prefixes" {}
variable "vnet_tags" {}
variable "vnet_vnet_name" {}

//--------------------------------------------------------------------
// Modules
module "compute" {
  source  = "app.terraform.io/cdunlap/compute/azurerm"
  version = "1.2.0"

  admin_password = "${var.compute_admin_password}"
  admin_username = "${var.compute_admin_username}"
  boot_diagnostics = "${var.compute_boot_diagnostics}"
  boot_diagnostics_sa_type = "${var.compute_boot_diagnostics_sa_type}"
  data_disk = "${var.compute_data_disk}"
  data_disk_size_gb = "${var.compute_data_disk_size_gb}"
  data_sa_type = "${var.compute_data_sa_type}"
  delete_os_disk_on_termination = "${var.compute_delete_os_disk_on_termination}"
  is_windows_image = "${var.compute_is_windows_image}"
  location = "US West 2"
  nb_instances = "${var.compute_nb_instances}"
  nb_public_ip = "${var.compute_nb_public_ip}"
  public_ip_address_allocation = "${var.compute_public_ip_address_allocation}"
  public_ip_dns = "${var.compute_public_ip_dns}"
  remote_port = "${var.compute_remote_port}"
  resource_group_name = "${var.compute_resource_group_name}"
  ssh_key = "${var.compute_ssh_key}"
  storage_account_type = "${var.compute_storage_account_type}"
  tags = "${var.compute_tags}"
  vm_hostname = "${var.compute_vm_hostname}"
  vm_os_id = "${var.compute_vm_os_id}"
  vm_os_offer = "${var.compute_vm_os_offer}"
  vm_os_publisher = "${var.compute_vm_os_publisher}"
  vm_os_simple = "${var.compute_vm_os_simple}"
  vm_os_sku = "${var.compute_vm_os_sku}"
  vm_os_version = "${var.compute_vm_os_version}"
  vm_size = "${var.compute_vm_size}"
  vnet_subnet_id = "${var.compute_vnet_subnet_id}"
}

module "vnet" {
  source  = "app.terraform.io/cdunlap/vnet/azurerm"
  version = "1.2.0"

  address_space = "10.0.0.0/16"
  dns_servers = "1.1.1.1"
  location = "US West 2"
  nsg_ids = "${var.vnet_nsg_ids}"
  resource_group_name = "cd-demo"
  subnet_names = "${var.vnet_subnet_names}"
  subnet_prefixes = "${var.vnet_subnet_prefixes}"
  tags = "${var.vnet_tags}"
  vnet_name = "${var.vnet_vnet_name}"
}