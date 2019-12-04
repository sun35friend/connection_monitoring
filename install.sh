#!/bin/bash
################ Configure Connection monitoring ###################

# set permissions for script
chmod 0755 /scripts/connection_monitoring
# creating logfile and set permissions
touch /var/log/connection_monitoring.log 
chmod 0640 /var/log/connection_monitoring.log 
chown root:adm /var/log/connection_monitoring.log 
# adding cronjob
echo "" >> /var/spool/cron/crontabs/root
echo "# Check Network Connection and reconnect if lost" >> /var/spool/cron/crontabs/root
echo "*/5 * * * * /scripts/connection_monitoring > /var/log/connection_monitoring.log 2>&1" >> /var/spool/cron/crontabs/root

######## Watchdog installation and configuration #################

# Load the bcm2708_wdog kernel module on next reboot
echo "bcm2708_wdog" | sudo tee -a /etc/modules
# install watchdog daemon
sudo apt update && sudo apt install watchdog
# make sure Watchdog runs after every boot
sudo update-rc.d watchdog defaults
# configuration /etc/watchdog.conf
sed -i 's|#max-load-1              = 24|max-load-1              = 24|' /etc/watchdog.conf
sed -i 's|#watchdog-device = /dev/watchdog|watchdog-device = /dev/watchdog|' /etc/watchdog.conf
echo "watchdog-timeout = 10" >> /etc/watchdog.conf
echo "interval = 2" >> /etc/watchdog.conf


########## Exit install.sh Configuration Script ##########

echo "installation complete... rebooting System..."
sudo /sbin/reboot
exit
