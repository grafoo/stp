#! /bin/bash
sudo cp /usr/lib/systemd/system/rfkill-block@.service /etc/systemd/system/rfkill-block@bluetooth.service
sudo systemctl enable rfkill-block@bluetooth.service
