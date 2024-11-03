#!/bin/sh
set -e

# We need /etc/passwd and /etc/group to exist before running dpkg.
export DPKG_ROOT=/rootfs
/rootfs/var/lib/dpkg/info/base-passwd.preinst install

# Configure all unpacked packages.
dpkg \
  --root=/rootfs \
  --admindir=/rootfs/var/lib/dpkg \
  --instdir=/rootfs \
  --log=/rootfs/var/log/dpkg.log \
  --configure -a