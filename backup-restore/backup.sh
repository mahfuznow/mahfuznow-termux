termux-setup-storage &&\
pkg install tar &&\
cd ~/.. &&\
tar -zcvf /sdcard/termux-backup.tar.gz home usr &&\
echo "========Backup compleeted ======"
