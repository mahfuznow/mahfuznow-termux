# Termux Backup & restore

## Restore
* First place the `termux-backup.tar.gz` into `Internal storage`
* Allow storage permission to `Termux` app
* run the following code:

```bash
#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage &&\
echo "======== Restoring home =========" &&\
cd ~/.. &&\
rm -rf home &&\
tar -zxvf /sdcard/termux-backup.tar.gz home &&\
echo "======== Restoring usr =========" &&\
cp  home/mahfuznow-termux/backup-restore/busybox ./tar && \
chmod +x tar && \
rm -rf usr &&\
unset LD_PRELOAD &&\
./tar -zxvf /sdcard/termux-backup.tar.gz usr &&\
echo "====Restoring compleeted successfully, Please restart Termux ===="
```


## Backup 

* Allow storage permission to `Termux` app
* run the following code:

```bash
#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage &&\
pkg install tar &&\
cd ~/.. &&\
tar -zcvf /sdcard/termux-backup.tar.gz home usr &&\
echo "========Backup compleeted ======"
```
* Backup file will be in `Internal Storage`
named `termux-backup.tar.gz`
