#!/bin/bash -e

install -m 755 files/dos4pi-splash.service "${ROOTFS_DIR}/etc/systemd/system/dos4pi-splash.service"
install -m 644 files/intro.mp4 "${ROOTFS_DIR}/home/pi/intro.mp4"

on_chroot << EOF
systemctl enable dos4pi-splash
EOF


