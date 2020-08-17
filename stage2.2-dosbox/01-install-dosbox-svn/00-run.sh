#!/bin/bash -e
# Inspired by the RetroPie-Setup installation scripts:
# https://github.com/RetroPie/RetroPie-Setup/blob/master/scriptmodules/emulators/dosbox-sdl2.sh
# https://github.com/RetroPie/RetroPie-Setup/blob/master/scriptmodules/emulators/dosbox.sh
# https://www.raspberrypi.org/forums/viewtopic.php?t=245674#p1516539


on_chroot << EOF
svn checkout https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk dosbox-code-0
cd dosbox-code-0

./autogen.sh
./configure --disable-opengl

sed -i 's|/\* #undef C_DYNREC \*/|#define C_DYNREC 1|' config.h
sed -i 's/C_TARGETCPU.*/C_TARGETCPU ARMV7LE/g' config.h
sed -i 's|/\* #undef C_UNALIGNED_MEMORY \*/|#define C_UNALIGNED_MEMORY 1|' config.h

make
make install
chmod +x /usr/local/bin/dosbox

cd ..
# rm -rf dosbox-code-0
EOF

#install -m 755 "./src/dosbox" "${ROOTFS_DIR}/usr/local/bin/dosbox"