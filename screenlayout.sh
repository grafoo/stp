#! /usr/bin/env bash

# this script configures the internal notebook screen and
# the external one connected via displayport like this
#  --------------------------- 
# |                           |
# |                           |
# |                           |
# |                           |
# |                           |
# |                           |
# |                           |
#  ---------------------------
#         -------------
#        |             |
#        |             |
#        |             |
#        |             |
#         -------------

# the default location suggested by arandr for stuff like this is $HOME/.screenlayout
# but i actually do not know what program would use this file as its default config
# therefore openbox is running this script via its .config/openbox/autostart file

if $(xrandr --query | grep -q "DP1 connected"); then
  xrandr \
    --output DP1 --primary --mode 1920x1200 --pos 0x0 --rotate normal \
    --output LVDS1 --mode 1280x800 --pos 320x1200 --rotate normal \
    --output VGA1 --off
fi
