#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage &&\
echo "======== Restoring home =========" &&\
cd ~/.. &&\
rm -rf home &&\
tar -zxvf /sdcard/termux-backup.tar.gz home &&\
echo "======== Restoring usr =========" &&\
cp  home/mahfuznow-termux/backup-restore/busybox ./busybox-tar && \
chmod +x tar && \
rm -rf usr &&\
unset LD_PRELOAD &&\
./busybox-tar -zxvf /sdcard/termux-backup.tar.gz usr &&\
echo "====Restoring compleeted successfully, Please restart Termux ===="
