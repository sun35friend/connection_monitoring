#!/bin/bash

# set permissions to script
chmod 0755 /scripts/connection_monitoring/connection_monitoring
echo "Permissions set to Script"

# creating logfile and set permissions
touch /var/log/connection_monitoring.log
chmod 0640 /var/log/connection_monitoring.log
chown root:adm /var/log/connection_monitoring.log
echo "Logfile configured"

# creating cronjob
echo "" >> /var/spool/cron/crontabs/root
echo "# Check Network Connection and reconnect if lost" >> /var/spool/cron/crontabs/root
echo "*/5 * * * * /scripts/connection_monitoring/connection_monitoring > /var/log/connection_monitoring.log 2>&1" >> /var/spool/cron/crontabs/root
echo "cronjob added"

# exit installation
echo
echo "installation complete..."
exit
