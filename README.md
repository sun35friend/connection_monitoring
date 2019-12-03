Script checks to see if WiFi has a network IP and if not try to reconnect
A lock file will be used which prevents the script from running more than one at a time.  
If lockfile is old, it will be removed.
Output Messages will be written to /var/log/wifi_check.log

Date:      03.12.2019

Author:    Florian Weiner (sun35friend)
           sun35friend@gmail.com

Title:     wifi_check

Copyright: Copyright (c) 2019 Florian Weiner (sun35friend@gmail.com)
           https://github.com/sun30friend/wifi_check


>>> Original Project from TNET Services, Inc <<<

Author:    Kevin Reed (Dweeber)
           dweeber.dweebs@gmail.com
Project:   Raspberry Pi Stuff

Copyright: Copyright (c) 2012 Kevin Reed kreed@tnet.com
           https://github.com/dweeber/WiFi_Check

Changes to original Project   

- cronjob creation with redirecting output to logfile 
- /sbin/dhcpcd -n $wlan will be used for wifi reconnect

Installation:

o Install where you want to run it from like /scripts 
o chmod 0755 /scripts/wifi_check 
o touch /var/log/wifi_check.log 
o chmod 0640 /var/log/wifi_check.log 
o chown rood:adm /var/log/wifi_check.log 
o Add to crontab

Cronjob will run the wifi_check Script every 5 Minutes
I suggest to only run it with a short timeframe with less than 5 Minutes for troubleshooting

*/5 * * * * /scripts/wifi_check > /var/log/wifi_check.log 2>&1
