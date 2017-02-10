sudo apt-get gtk-redshift
gtk-redshift -l 2.97:77.59

## Crontab

**To see the list with the programs you can type**
```bash
crontab -l
```

**To edit the list type**
```bash
crontab -e
```

**Add this line in the end, to boot redshift whenever computer starts up**
```bash
@reboot export DISPLAY=:0.0 && /usr/bin/redshift -l 2.97:77.59
```

*Access help for redshift using:*
```bash
redshift -h
```