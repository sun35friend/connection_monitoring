Script to check if specified Network Interface is up and a ping to a test IP Address is successful.
A lockfile prevents the script from running multiple times  
Output Messages are redirected to /var/log/connection_monitoring.log

Beside the Network Connection Monitoring, Watchdog will be installed and configured
to Auto-reboot a hung Raspberry Pi using the on-board watchdog timer.
If you don't want to have Watchdog installed, you need to comment or remove the Watchdoc
Area within the install.sh File.

Project:        connection_monitoring

Author:         Florian Weiner (sun35friend@gmail.com)

Copyright:      Copyright (c) 2019 Florian Weiner

Github:         https://github.com/sun35friend/connection_monitoring

Installation:

to use the install.sh configuration script, you need to create a folder /scripts, 
clone the git repository and run the script with below commands:

- sudo mkdir -p /scripts
- sudo git clone https://github.com/sun35friend/connection_monitoring.git /scripts/connection_monitoring
- sudo sh /scripts/connection_monitoring/install.sh
