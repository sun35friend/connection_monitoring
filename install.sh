#!/bin/bash
################ Configure Connection monitoring ###################

# set permissions for script
chmod 0755 /scripts/connection_monitoring/connection_monitoring
# creating logfile and set permissions
touch /var/log/connection_monitoring.log 
chmod 0640 /var/log/connection_monitoring.log 
chown root:adm /var/log/connection_monitoring.log 
# adding cronjob which runs every 5 Minutes
echo "" >> /var/spool/cron/crontabs/root
echo "# Check Network Connection and reconnect if lost" >> /var/spool/cron/crontabs/root
echo "*/5 * * * * /scripts/connection_monitoring/connection_monitoring > /var/log/connection_monitoring.log 2>&1" >> /var/spool/cron/crontabs/root


######## Watchdog installation and configuration #################

# Load the bcm2708_wdog kernel module on next reboot
sudo modprobe bcm2835_wdt
#sudo echo "bcm2835_wdt" | sudo tee -a /etc/modules
# install watchdog daemon
sudo apt update && sudo apt install watchdog -y
# enable Watchdog System is booting
sudo update-rc.d watchdog defaults
# backup original watchdog.conf
sudo mv /etc/watchdog.conf /etc/watchdog.conf.orig
# create new watchdog.conf
sudo touch /etc/watchdog.conf
sudo echo "# Watchdog Configuration File installed by Raspberry Monitoring Tool" >> /etc/watchdog.conf
sudo echo "# Author:    Florian Weiner (florian@weiner-online.net)" >> /etc/watchdog.conf
sudo echo "# Copyright: © 2019" >> /etc/watchdog.conf
sudo echo "#" >> /etc/watchdog.conf
sudo echo "Installation Date: " date >> /etc/watchdog.conf
sudo echo >> /etc/watchdog.conf
sudo echo "# if your machine is really hung, the loadavg will go much higher than 25" >> /etc/watchdog.conf
sudo echo "max-load-1 = 24" >> /etc/watchdog.conf
sudo echo >> /etc/watchdog.conf
sudo echo "reboot if there is less than 1 page of free memory (=4k)" >> /etc/watchdog.conf
sudo echo "min-memory=1" >> /etc/watchdog.conf
sudo echo >> /etc/watchdog.conf
sudo echo "watchdog-device = /dev/watchdog" >> /etc/watchdog.conf
sudo echo >> /etc/watchdog.conf
sudo echo "# This greatly decreases the chance that watchdog won't be scheduled before" >> /etc/watchdog.conf
sudo echo "# your machine is really loaded" >> /etc/watchdog.conf
sudo echo "watchdog-timeout = 10" >> /etc/watchdog.conf
sudo echo "interval = 2" >> /etc/watchdog.conf
sudo echo "realtime = yes" >> /etc/watchdog.conf
sudo echo "priority = 1" >> /etc/watchdog.conf


########## Exit install.sh Configuration Script ##########

echo "installation complete... rebooting System..."
sudo /sbin/reboot
exit
