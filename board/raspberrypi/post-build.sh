#!/bin/sh

set -u
set -e

## Create directory for animation frames
#mkdir -p "${TARGET_DIR}/usr/share/boot-animation"
#
## Copy PPM frames
#cp ${BOARD_DIR}/firma/ruscic-animation/*.ppm "${TARGET_DIR}/usr/share/boot-animation/"
#
## Copy and set permissions for scripts
#cp ${BOARD_DIR}/firma/show-animation.sh "${TARGET_DIR}/usr/bin/"
#chmod +x "${TARGET_DIR}/usr/bin/show-animation.sh"
#
#cp ${BOARD_DIR}/firma/S01bootanimation "${TARGET_DIR}/etc/init.d/"
#chmod +x "${TARGET_DIR}/etc/init.d/S01bootanimation"

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
# systemd doesn't use /etc/inittab, enable getty.tty1.service instead
elif [ -d ${TARGET_DIR}/etc/systemd ]; then
    mkdir -p "${TARGET_DIR}/etc/systemd/system/getty.target.wants"
    ln -sf /lib/systemd/system/getty@.service \
       "${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"
fi
