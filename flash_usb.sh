#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service

FIRMWARE=*.hex
for found in $FIRMWARE
do
  echo "Found $found firmware..."
  # take action on each file. $f store current file name
  /usr/bin/avrdude-original -p m328p -c arduino -P /dev/ttyUSB0 -b 115200 -F -U flash:w:${found} -v 

  # Output some advice
  echo "Once flashing has been completed, you should reboot your Pi-Star"
done
