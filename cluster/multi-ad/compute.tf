## Copyright (c) 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_core_instance" "ESMasterNode1" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = "ESMasterNode1"
  shape               = var.MasterNodeShape
  
  dynamic "agent_config" {
    for_each = var.use_bastion_service ? [1] : []
    content {
      are_all_plugins_disabled = false
      is_management_disabled   = false
      is_monitoring_disabled   = false
      plugins_config {
        desired_state = "ENABLED"
        name          = "Bastion"
      }
    }
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_masternode_shape ? [1] : []
    content {
      memory_in_gbs = var.MasterNode_Flex_Shape_Memory
      ocpus = var.MasterNode_Flex_Shape_OCPUS
    }
  }
  
  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
    subnet_id        = oci_core_subnet.PrivSubnetAD1.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = data.template_cloudinit_config.cloud_init.rendered
  }

  source_details {
    source_id               = lookup(data.oci_core_images.InstanceImageOCID_MasterNode.images[0], "id")
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESMasterNode2" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[1]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = "ESMasterNode2"
  shape               = var.MasterNodeShape

  dynamic "agent_config" {
    for_each = var.use_bastion_service ? [1] : []
    content {
      are_all_plugins_disabled = false
      is_management_disabled   = false
      is_monitoring_disabled   = false
      plugins_config {
        desired_state = "ENABLED"
        name          = "Bastion"
      }
    }
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_masternode_shape ? [1] : []
    content {
      memory_in_gbs = var.MasterNode_Flex_Shape_Memory
      ocpus = var.MasterNode_Flex_Shape_OCPUS
    }
  }

  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
    subnet_id        = oci_core_subnet.PrivSubnetAD2.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = data.template_cloudinit_config.cloud_init.rendered
  }

  source_details {
    source_id               = lookup(data.oci_core_images.InstanceImageOCID_MasterNode.images[0], "id")
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESMasterNode3" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[2]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = "ESMasterNode3"
  shape               = var.MasterNodeShape

  dynamic "agent_config" {
    for_each = var.use_bastion_service ? [1] : []
    content {
      are_all_plugins_disabled = false
      is_management_disabled   = false
      is_monitoring_disabled   = false
      plugins_config {
        desired_state = "ENABLED"
        name          = "Bastion"
      }
    }
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_masternode_shape ? [1] : []
    content {
      memory_in_gbs = var.MasterNode_Flex_Shape_Memory
      ocpus = var.MasterNode_Flex_Shape_OCPUS
    }
  }

  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
    subnet_id        = oci_core_subnet.PrivSubnetAD3.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = data.template_cloudinit_config.cloud_init.rendered
  }

  source_details {
    source_id               = lookup(data.oci_core_images.InstanceImageOCID_MasterNode.images[0], "id")
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESDataNode1" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = "ESDataNode1"
  shape               = var.DataNodeShape

  dynamic "agent_config" {
    for_each = var.use_bastion_service ? [1] : []
    content {
      are_all_plugins_disabled = false
      is_management_disabled   = false
      is_monitoring_disabled   = false
      plugins_config {
        desired_state = "ENABLED"
        name          = "Bastion"
      }
    }
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_datanode_shape ? [1] : []
    content {
      memory_in_gbs = var.DataNode_Flex_Shape_Memory
      ocpus = var.DataNode_Flex_Shape_OCPUS
    }
  }

  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
    subnet_id        = oci_core_subnet.PrivSubnetAD1.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = data.template_cloudinit_config.cloud_init.rendered
  }

  source_details {
    source_id               = lookup(data.oci_core_images.InstanceImageOCID_DataNode.images[0], "id")
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESDataNode2" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = "ESDataNode2"
  shape               = var.DataNodeShape

  dynamic "agent_config" {
    for_each = var.use_bastion_service ? [1] : []
    content {
      are_all_plugins_disabled = false
      is_management_disabled   = false
      is_monitoring_disabled   = false
      plugins_config {
        desired_state = "ENABLED"
        name          = "Bastion"
      }
    }
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_datanode_shape ? [1] : []
    content {
      memory_in_gbs = var.DataNode_Flex_Shape_Memory
      ocpus = var.DataNode_Flex_Shape_OCPUS
    }
  }

  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
    subnet_id        = oci_core_subnet.PrivSubnetAD1.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = data.template_cloudinit_config.cloud_init.rendered
  }

  source_details {
    source_id               = lookup(data.oci_core_images.InstanceImageOCID_DataNode.images[0], "id")
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESDataNode3" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[1]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = "ESDataNode3"
  shape               = var.DataNodeShape

  dynamic "agent_config" {
    for_each = var.use_bastion_service ? [1] : []
    content {
      are_all_plugins_disabled = false
      is_management_disabled   = false
      is_monitoring_disabled   = false
      plugins_config {
        desired_state = "ENABLED"
        name          = "Bastion"
      }
    }
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_datanode_shape ? [1] : []
    content {
      memory_in_gbs = var.DataNode_Flex_Shape_Memory
      ocpus = var.DataNode_Flex_Shape_OCPUS
    }
  }

  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
    subnet_id        = oci_core_subnet.PrivSubnetAD2.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = data.template_cloudinit_config.cloud_init.rendered
  }

  source_details {
    source_id               = lookup(data.oci_core_images.InstanceImageOCID_DataNode.images[0], "id")
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  timeouts {
    create = var.create_timeout
  }
}

resource "oci_core_instance" "ESDataNode4" {
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[1]["name"]
  compartment_id      = var.compartment_ocid
  display_name        = "ESDataNode4"
  shape               = var.DataNodeShape

  dynamic "agent_config" {
    for_each = var.use_bastion_service ? [1] : []
    content {
      are_all_plugins_disabled = false
      is_management_disabled   = false
      is_monitoring_disabled   = false
      plugins_config {
        desired_state = "ENABLED"
        name          = "Bastion"
      }
    }
  }

  dynamic "shape_config" {
    for_each = local.is_flexible_datanode_shape ? [1] : []
    content {
      memory_in_gbs = var.DataNode_Flex_Shape_Memory
      ocpus = var.DataNode_Flex_Shape_OCPUS
    }
  }

  depends_on          = [oci_core_instance.BastionHost]

  create_vnic_details {
    subnet_id        = oci_core_subnet.PrivSubnetAD2.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = data.template_cloudinit_config.cloud_init.rendered
  }

  source_details {
    source_id               = lookup(data.oci_core_images.InstanceImageOCID_DataNode.images[0], "id")
    source_type             = "image"
    boot_volume_size_in_gbs = var.BootVolSize
  }

  defined_tags = {"${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

  timeouts {
    create = var.create_timeout
  }
}


