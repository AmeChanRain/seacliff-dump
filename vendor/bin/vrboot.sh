#!/vendor/bin/sh

# do what's easy for now, as we may need extra boost for other things (such as warm up the display)
sleep 30
# Different devices can choose to hook to this property change and disable boot boosting then
setprop vendor.boot.boost.finished 1
