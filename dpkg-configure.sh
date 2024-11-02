#!/bin/sh
set -e

# Configure all unpacked packages.
dpkg --root=/rootfs --admindir=/rootfs/var/lib/dpkg --instdir=/rootfs --configure -a