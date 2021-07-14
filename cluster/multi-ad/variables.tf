## Copyright (c) 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}

variable "availability_domain_name" {
  default = ""
}

variable "use_bastion_service" {
  default = true
}

variable "availability_domain_number" {
  default = 0
}

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.1"
}

variable "BastionShape" {
  default = "VM.Standard.E3.Flex"
}

variable "Bastion_Flex_Shape_OCPUS" {
    default = 1
}

variable "Bastion_Flex_Shape_Memory" {
    default = 1
}

variable "MasterNodeShape" {
  default = "VM.Standard.E4.Flex"
}

variable "MasterNode_Flex_Shape_OCPUS" {
    default = 2
}

variable "MasterNode_Flex_Shape_Memory" {
    default = 30
}

variable "DataNodeShape" {
  default = "VM.Standard.E4.Flex"
}

variable "DataNode_Flex_Shape_OCPUS" {
    default = 4
}

variable "DataNode_Flex_Shape_Memory" {
    default = 60
}


variable "BootVolSize" {
  default = "100"
}

variable "ssh_public_key" {
  default = ""
}

variable "lb_shape" {
  default = "flexible"
}

variable "flex_lb_min_shape" {
  default = "10"
}

variable "flex_lb_max_shape" {
  default = "100"
}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "VCN-CIDR" {
  default = "192.168.0.0/25"
}

variable "BastSubnetAD1CIDR" {
  default = "192.168.0.0/28"
}

variable "PrivSubnetAD1CIDR" {
  default = "192.168.0.16/28"
}

variable "PrivSubnetAD2CIDR" {
  default = "192.168.0.32/28"
}

variable "PrivSubnetAD3CIDR" {
  default = "192.168.0.48/28"
}

variable "LBSubnetAD1CIDR" {
  default = "192.168.0.64/28"
}

variable "LBSubnetAD2CIDR" {
  default = "192.168.0.80/28"
}

variable "ESBootStrap" {
  default = "./scripts/ESBootStrap.sh"
}

variable "BastionBootStrap" {
  default = "./scripts/BastionBootStrap.sh"
}

variable "elasticsearch_download_url" {
  default = "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.7.1.rpm"
#  default = "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.0-x86_64.rpm"
}

variable "kibana_download_url" {
#  default = "https://artifacts.elastic.co/downloads/kibana/kibana-7.10.0-x86_64.rpm"
  default = "https://artifacts.elastic.co/downloads/kibana/kibana-6.7.1-x86_64.rpm"
}


variable "backend_set_health_checker_interval_ms" {
  default = "15000"
}

variable "KibanaPort" {
  default = "5601"
}

variable "ESDataPort" {
  default = "9200"
}

variable "ESDataPort2" {
  default = "9300"
}

variable "create_timeout" {
  default = "60000m"
}

variable "DataVolSize" {
  default = "200"
}

variable "volume_attachment_attachment_type" {
  default = "iscsi"
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard.E3.Flex",
    "VM.Standard.E4.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_bastion_shape = contains(local.compute_flexible_shapes, var.BastionShape)
  is_flexible_masternode_shape = contains(local.compute_flexible_shapes, var.MasterNodeShape)
  is_flexible_datanode_shape = contains(local.compute_flexible_shapes, var.DataNodeShape)
  is_flexible_lb_shape = var.lb_shape == "flexible" ? true : false
}
