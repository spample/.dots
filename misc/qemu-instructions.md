## Check if cpu virtualization is enabled
```bash
LC_ALL=C lscpu | grep Virtualization
```
|CPU|Enabled|Disabled
|-----|-----|----------------|
|Intel|`Vt-x`|Returns nothing|
|-----|-----|-----------------|
|AMD  |`AMD-V`|Returns nothing|
|-----|-----|----------------|

## Install Dependencies:
```bash
sudo pacman --needed -S qemu-full qemu-emulators-full virt-manager virt-viewer dnsmasq vde2 openbsd-netcat libvirt
```
```bash
yay --needed -S bridge-utils
```

## Enable libvirtd
```bash
sudo systemctl enable libvirtd
```
```bash
sudo systemctl start --now libvirtd
```

#### Create a group so you dont need `sudo`
```bash
sudo usermod -aG libvirt $(whoami)
newgrp libvirt

sudo usermod -aG render,video $USER
```

## Check network config (make sure file exist and has stuff inside it)
```bash
sudo EDITOR=nano virsh net-edit default
```

## restart libvirtd (if this takes awhile, restart your computer)
```bash
sudo systemctl restart libvirtd
```

## Start Virtual Network
```bash
sudo virsh net-start default
```
#### Set up network as autostart
```bash
sudo virsh net-autostart default
```

## {optional} Check qemu version
```bash
qemu-system-x86_64 --version
```
## {optional} Check virtual network setup
```bash
sudo virsh net-list --all
```
#### should look something like this:
```
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes
```

## Open `virt-manager`
```bash
virt-manager
```

## Setting up Ethernet passthrough:
In virt-manager: go to the setting for the VM and in the `NIC`
`Network Source:` Macvtap
`Device Name` Ethernet name (e.g `enp0s31f6`)

## Installing tmp 2.0
```bash
sudo pacman -S swtpm
```
Settings:
TPM:
  Type: `Emulated`
  Model: `CRB`
  Version: `2.0`

## Seeting up shared clipboard:
on windows install `Windows SPICE Guest Tools`[https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-0.141/spice-guest-tools-0.141.exe]

#### Verify the SPICE agent channel exists

In virt-manager:
>Add Hardware → Channel

Set:
>Name: com.redhat.spice.0
Device Type: Spice agent

(Most VM templates add this automatically.

Use the SPICE display
Under Display:
>Type: Spice Server

Under Video:
>Virtio or QXL
