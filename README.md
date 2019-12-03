Script checks to see if WiFi has a network IP and if not restart WiFi Interface
and Uses a lock file which prevents the script from running more than one at a time.  
If lockfile is old, it removes it.
Output Messages will be written to /var/log/wifi_check.log

Date:      03.12.2019
Author:    Florian Weiner
           florian@weiner-online.net

changes:   - cronjob creation with redirecting output to logfile
           - using /sbin/dhcpcd -n $wlan instead of "ifdown" and "ifup"

Copyright: Copyright (c) Changes 2019 Florian Weiner (florian@weiner-online.net)
           https://github.com/sun30friend/wifi_check

Original Project is from TNET Services, Inc

Author:    Kevin Reed (Dweeber)
           dweeber.dweebs@gmail.com
Project:   Raspberry Pi Stuff

Copyright: Copyright (c) 2012 Kevin Reed <kreed@tnet.com>
           https://github.com/dweeber/WiFi_Check

Instructions:

o Install where you want to run it from like /scripts
o chmod 0755 /scripts/wifi_check
o touch /var/log/wifi_check.log
o chmod 0640 /var/log/wifi_check.log
o chown rood:adm /var/log/wifi_check.log
o Add to crontab

Run Every 5 mins - Seems like ever min is over kill unless
this is a very common problem.  If once a min change */5 to *
once every 2 mins */5 to */2

*/5 * * * * /scripts/wifi_check > /var/log/wifi_check.log 2>&1
