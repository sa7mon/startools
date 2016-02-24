#!/bin/bash

### BEGIN INIT INFO
# Provides: capture
# Required-Start:
# Required-Stop:
# Should-Start:
# Should-Stop:
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Start and Stop the capture
# Description: capture
### END INIT INFO

# Written to automate Raspberry Pi - driven captures using
# hostapd-wpe
#
# Created on: 9-12-15
# Created by: Dan Salmon
#	twitter.com/bltjetpack
#	github.com/sa7mon  
#	https://danthesalmon.com
#
# 1. Change directories to hostapd folder
# 2. Create file with time name (mm-dd-yyyy - hh:mm.log)
# 3. Start capturing to that file
# 
# Place in /etc/init.d/

cd ~/Downloads/hostapd-2.2/hostapd

RANDNAME="/root/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 10).log"
echo "Moving log to: "$RANDNAME
mv ./hostapd-wpe.log $RANDNAME

# Creating hostapd-wpe log
touch hostapd-wpe.log

echo "Starting AP..."
./hostapd-wpe hostapd-wpe.conf
