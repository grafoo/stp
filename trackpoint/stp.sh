#! /bin/bash

case "$1" in
  "-i")
    sudo install -m 755 trackpoint-setup.sh /usr/local/bin/
    sudo install -m 644 trackpoint-setup.service /etc/systemd/system/
    sudo systemctl enable trackpoint-setup.service
    ;;
  "-u")
    sudo systemctl disable trackpoint-setup.service
    sudo rm /usr/local/bin/trackpoint-setup.sh
    sudo rm /etc/systemd/system/trackpoint-setup.service
    ;;
  *)
    echo "Usage: $0 {-i|-u}"
    ;;
esac
