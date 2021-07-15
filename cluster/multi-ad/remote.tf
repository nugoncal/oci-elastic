## Copyright (c) 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

data "template_file" "setup_esbootstrap" {
  template = file(var.ESBootStrap)

  vars = {
    elasticsearch_download_url  = var.elasticsearch_download_url
    kibana_download_url         = var.kibana_download_url
    ESDataPort                  = var.ESDataPort
    ESDataPort2                 = var.ESDataPort2
    KibanaPort                  = var.KibanaPort
  }
}

resource "null_resource" "ESMasterNode1_BootStrap" {
  depends_on = [oci_core_instance.ESMasterNode1, oci_core_instance.ESMasterNode2, oci_core_instance.ESMasterNode3, oci_core_instance.ESDataNode1, oci_core_instance.ESDataNode2, oci_core_instance.ESDataNode3, oci_core_instance.ESDataNode4]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESMasterNode1Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESMasterNode1[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }

    content     = data.template_file.setup_esbootstrap.rendered
    destination = "~/esbootstrap.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESMasterNode1Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESMasterNode1[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "chmod +x ~/esbootstrap.sh",
      "sudo ~/esbootstrap.sh",
    ]
  }
}

resource "null_resource" "ESMasterNode2_BootStrap" {
  depends_on = [oci_core_instance.ESMasterNode1, oci_core_instance.ESMasterNode2, oci_core_instance.ESMasterNode3, oci_core_instance.ESDataNode1, oci_core_instance.ESDataNode2, oci_core_instance.ESDataNode3, oci_core_instance.ESDataNode4]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESMasterNode2Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESMasterNode2[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }

    content     = data.template_file.setup_esbootstrap.rendered
    destination = "~/esbootstrap.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESMasterNode2Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESMasterNode2[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "chmod +x ~/esbootstrap.sh",
      "sudo ~/esbootstrap.sh",
    ]
  }
}

resource "null_resource" "ESMasterNode3_BootStrap" {
  depends_on = [oci_core_instance.ESMasterNode1, oci_core_instance.ESMasterNode2, oci_core_instance.ESMasterNode3, oci_core_instance.ESDataNode1, oci_core_instance.ESDataNode2, oci_core_instance.ESDataNode3, oci_core_instance.ESDataNode4]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESMasterNode3Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESMasterNode3[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }

    content     = data.template_file.setup_esbootstrap.rendered
    destination = "~/esbootstrap.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESMasterNode3Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESMasterNode3[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "chmod +x ~/esbootstrap.sh",
      "sudo ~/esbootstrap.sh",
    ]
  }
}

resource "null_resource" "ESDataNode1_BootStrap" {
  depends_on = [oci_core_instance.ESMasterNode1, oci_core_instance.ESMasterNode2, oci_core_instance.ESMasterNode3, oci_core_instance.ESDataNode1, oci_core_instance.ESDataNode2, oci_core_instance.ESDataNode3, oci_core_instance.ESDataNode4]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode1Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode1[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }

    content     = data.template_file.setup_esbootstrap.rendered
    destination = "~/esbootstrap.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode1Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode1[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "chmod +x ~/esbootstrap.sh",
      "sudo ~/esbootstrap.sh",
    ]
  }
}

resource "null_resource" "ESDataNode2_BootStrap" {
  depends_on = [oci_core_instance.ESMasterNode1, oci_core_instance.ESMasterNode2, oci_core_instance.ESMasterNode3, oci_core_instance.ESDataNode1, oci_core_instance.ESDataNode2, oci_core_instance.ESDataNode3, oci_core_instance.ESDataNode4]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode2Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode2[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }

    content     = data.template_file.setup_esbootstrap.rendered
    destination = "~/esbootstrap.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode2Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode2[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "chmod +x ~/esbootstrap.sh",
      "sudo ~/esbootstrap.sh",
    ]
  }
}

resource "null_resource" "ESDataNode3_BootStrap" {
  depends_on = [oci_core_instance.ESMasterNode1, oci_core_instance.ESMasterNode2, oci_core_instance.ESMasterNode3, oci_core_instance.ESDataNode1, oci_core_instance.ESDataNode2, oci_core_instance.ESDataNode3, oci_core_instance.ESDataNode4]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode3Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode3[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }

    content     = data.template_file.setup_esbootstrap.rendered
    destination = "~/esbootstrap.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode3Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode3[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "chmod +x ~/esbootstrap.sh",
      "sudo ~/esbootstrap.sh",
    ]
  }
}

resource "null_resource" "ESDataNode4_BootStrap" {
  depends_on = [oci_core_instance.ESMasterNode1, oci_core_instance.ESMasterNode2, oci_core_instance.ESMasterNode3, oci_core_instance.ESDataNode1, oci_core_instance.ESDataNode2, oci_core_instance.ESDataNode3, oci_core_instance.ESDataNode4]

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode4Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode4[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }

    content     = data.template_file.setup_esbootstrap.rendered
    destination = "~/esbootstrap.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = data.oci_core_vnic.ESDataNode4Vnic.private_ip_address
      private_key = tls_private_key.public_private_key_pair.private_key_pem
      script_path = "/home/opc/myssh.sh"
      agent       = false
      timeout     = "10m"
      bastion_host = var.use_bastion_service ? "host.bastion.${var.region}.oci.oraclecloud.com" : oci_core_instance.BastionHost[0].public_ip
      bastion_user = var.use_bastion_service ? oci_bastion_session.ssh_via_bastion_service_ESDataNode4[0].id : "opc"
      bastion_port = "22"
      bastion_private_key = tls_private_key.public_private_key_pair.private_key_pem
    }
    inline = [
      "chmod +x ~/esbootstrap.sh",
      "sudo ~/esbootstrap.sh",
    ]
  }
}