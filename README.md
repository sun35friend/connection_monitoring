Script checks to see if WiFi has a network IP and if not try to reconnect
A lock file will be used which prevents the script from running more than one at a time.  
If lockfile is old, it will be removed.
Output Messages will be written to /var/log/connection_monitoring.log

Beside the Network Connection Monitoring, Watchdog will be installed and configured
to Auto-reboot a hung Raspberry Pi using the on-board watchdog timer.
If you don't want to have Watchdog installed, you need to comment or remove the Watchdoc
Area within the install.sh File.

Project:        connection_monitoring

Author:         Florian Weiner (sun35friend)
                sun35friend@gmail.com

Copyright:      Copyright (c) 2019 Florian Weiner (sun35friend@gmail.com)
                https://github.com/sun30friend/connection_monitoring

Installation:

- sudo mkdir -p /scripts
- sudo git clone https://github.com/sun30friend/connection_monitoring.git
- sudo chmod 0775 /scripts/install.sh
- sudo /scripts/install.sh
