#!/system/bin/sh

# vision.img is placed in a subdirectory to get around
# several SELinux restrictions on writing to /data/misc
VISION_IMG="/data/misc/vision_img/vision.img"
VISION_SIZE="500MB"
VISION_MOUNT_PROP="ovr.vision.mount"

if [[ ! -f $VISION_IMG ]]; then
    fallocate -l $VISION_SIZE $VISION_IMG
    mkfs.ext4 $VISION_IMG
fi

LOOP_DEVICE=`losetup -s -f $VISION_IMG`

setprop $VISION_MOUNT_PROP "$LOOP_DEVICE"
