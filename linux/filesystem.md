# About /mnt/storage

## Overview

This locatation is a mounted filesystem where all Linux documents are kept. This way, we can share this information through Linux distributions.

This method is prefered over sharing the `/home/<user>` folder, because this directory usually contains distro specific information and configurations.

## Filesystem information:

Mount Point: /mnt/storage
Format: ext4

## Installation

Create the mount point: `sudo mkdir /mnt/storage`.

Add the following configuration to the `/etc/fstab` file:

```bash
# storage partition
UUID=dcd98b64-f181-4353-bb3e-ce0f3c5d7425	/mnt/storage	ext4    	auto,user,rw,exec 0 2
```

And finally, change the directory owner:
```bash
sudo chown mpavezb /mnt/storage
```

See also: https://www.binarytides.com/ubuntu-automatically-mount-partition-startup/
