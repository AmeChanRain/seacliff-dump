#!/system/bin/sh

dumpsys activity | grep top-activity | \
    sed 's/\(.*\):\(.*\)\/\(.*\)/\2/' | xargs am force-stop
