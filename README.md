# Azure and AWS Hybrid Infrastructure Setup with Terraform

This repository contains Terraform configuration files for deploying a hybrid infrastructure across Microsoft Azure and AWS. The main goal is to create and configure an Azure Virtual Network, Subnet, Network Interface, and a Linux Virtual Machine, along with other necessary resources.

## Files Structure

### 1. `main.tf`

This is the main Terraform configuration file. It contains the following components:

- **Terraform Block:** Specifies the required providers for Azure (`azurerm`) and AWS (`aws`), with specific versions.
- **Azure Provider Configuration:** Configures the Microsoft Azure Provider.
- **Resource Group:** Creates a resource group named `devops` in the `East US` region.
- **Virtual Network:** Creates a virtual network (`my-network`) within the resource group.
- **Subnet:** Defines a subnet (`internal`) within the virtual network.
- **Network Interface:** Creates a network interface (`my-nic`) and associates it with the subnet.
- **Virtual Machine:** Provisions a Linux virtual machine (`example-machine`) using an Ubuntu image, with custom SSH configuration and Docker installation as part of the provisioning process.
- **Public IP:** Allocates a public IP address to be associated with the network interface.
- **SSH Public Key:** Creates an SSH public key resource that will be used for secure access to the virtual machine.

### 2. `customdata.tpl`

This file contains a shell script used for provisioning the Linux virtual machine. The script installs Docker and configures it for use on the virtual machine.

### 3. `linux-ssh-script.tpl`

A template script used to configure SSH access on Linux systems. It appends the SSH configuration to the `~/.ssh/config` file.

### 4. `windows-ssh-script.tpl`

A PowerShell script template for configuring SSH access on Windows systems. It appends the SSH configuration to the `C:\Users\amose\.ssh\config` file.

## Prerequisites

- Ensure you have Terraform installed on your machine.
- Log into your Azure subscription using the command: `$  az login --tenant <TenantID>`.
- Ensure you have SSH keys generated and available in the default location (`~/.ssh/id_rsa.pub` for Linux/Mac, `C:\Users\amose\.ssh\id_rsa.pub` for Windows).

## How to Use

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Review the Execution Plan:**
   ```bash
   terraform plan
   ```

3. **Apply the Terraform Configuration::**
   ```bash
   terraform apply
   ```