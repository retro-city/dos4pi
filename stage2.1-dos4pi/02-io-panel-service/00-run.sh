#!/bin/bash -e

install -m 755 files/dos4pi-io-panel.service "${ROOTFS_DIR}/etc/systemd/system/dos4pi-io-panel.service"
install -m 644 files/turbo.py "${ROOTFS_DIR}/home/pi/turbo.py"

on_chroot << EOF
systemctl enable dos4pi-splash
EOF

