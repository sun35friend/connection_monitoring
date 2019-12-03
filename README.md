This Script checks the Network Connection if the Interface is up and a specified IP can be pinged
A lockfile prevents the script from running multiple times.  
Output Messages will be written to /var/log/connection_monitoring.log. 
The Logfile will be automatically overwritten on the next run

Project:        connection_monitoring

Author:         Florian Weiner (sun35friend)
                sun35friend@gmail.com

Copyright:      Copyright (c) 2019 Florian Weiner (sun35friend@gmail.com)
                https://github.com/sun30friend/connection_monitoring

Installation:

- sudo mkdir -p /scripts
- cd /scripts
- sudo git clone https://github.com/sun30friend/connection_monitoring.git
- sudo chmod 0775 /scripts/connection_monitoring/install.sh
- sudo /scripts/connection_monitoring/install.sh
