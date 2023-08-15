#!/vendor/bin/sh
# selinux context of any property starts with "persist.vendor.usb."
# or "vendor.usb." will be u:object_r:vendor_usb_prop:s0
hwaddr_property="persist.vendor.usb.ethernet.cdc.macaddr"
ifname_path="/config/usb_gadget/g1/functions/ecm.0/ifname"

log_tag=$0
function print_log() {
    echo "$1"
    log -p e -t "$log_tag" "$1"
}

ifname=$(cat $ifname_path)
hwaddr=$(getprop $hwaddr_property)
if [[ ! -n "$ifname" ]]; then
    print_log "Null ifname!"
    exit
elif [[ ! -n "$hwaddr" ]]; then
    print_log "Null HW address!"
    exit
fi

/vendor/bin/ifconfig $ifname down
if [[ $? -ne 0 ]]; then
    print_log "Failed to bring down $ifname"
    exit
fi

/vendor/bin/ifconfig $ifname hw ether $hwaddr
if [[ $? -ne 0 ]]; then
    print_log "Failed to set $ifname HW address to $hwaddr"
else
    print_log "HW address of $ifname is set to $hwaddr"
fi

/vendor/bin/ifconfig $ifname up
if [[ $? -ne 0 ]]; then
    print_log "Failed to bring up $ifname"
    exit
fi
