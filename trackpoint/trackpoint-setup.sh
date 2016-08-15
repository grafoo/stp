#! /bin/bash
echo -n 255 > /sys/devices/platform/i8042/serio1/speed
echo -n 205 > /sys/devices/platform/i8042/serio1/sensitivity
exit 0
