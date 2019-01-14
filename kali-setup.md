## To setup on Kali (RasPi Image)

1.  Copy capture.sh to /etc/init.d/ 

  ```update-rc.d capture defaults```

*  ```sudo apt-get update && apt-get upgrade```

* ```sudo apt-get install gcc make libssl-dev ```

* Edit _hostapd-2.2/hostapd/defconfig_ and uncomment line:
"CONFIG_LIBNL32=y". Probably line 35

*  ```cd hostapd-2.2```

  ```patch -p1 < ../hostapd-wpe/hostapd-wpe.patch``` 

  ```cd hostapd```

  ```make```

  ```cd ../../hostapd-wpe/certs```

  ```./bootstrap```

* Edit _hostapd-2.2/hostapd/hostapd-wpe.conf_ to your liking (You also may need to chmod it). A sample config has been provided: _hostapd-wpe.conf.sample_


*  Edit _/etc/NetworkManager/NetworkManager.conf_ and add the MAC address of the wireless card:

    [keyfile]<br/>
    unmanaged-devices=mac:00:11:22:33:44:55

## Description
The script should now run on reboot automatically. 

The script will put all the logs into /root/ with randomly generated names. It moves them each time the script is ran, so there may be empty log files. 

### Stopping 
To kill, run _stopcapture.sh_

### Log Parsing
To parse through all the logs, I've created a script called wpe-parse located here [https://github.com/sa7mon/wpe-parse](https://github.com/sa7mon/wpe-parse) 

It will also convert them from John format to Hashcat format.
