#!/bin/bash

echo ""
  echo "============================================="
  echo "========== Install linux in Termux =========="
  echo "============================================="
  echo ""
echo ""

echo "==== Choose Installation Option ===="
  distro=""
  echo "  1) Alpine"
  echo "  2) Debian"
  echo "  3) Fedora"
  echo "  4) Kali"
  echo "  5) Manjaro"
  echo "  6) Parrot"
  echo "  7) Ubuntu"
  echo "  8) Ubuntu19"
  echo "  9) Ubuntu20"
  echo "  10) Void"
  read o
  case $o in
    1) distro="Alpine";;
    2) distro="Debian";;
    3) distro="Fedora";;
    4) distro="Kali";;
    5) distro="Manjaro";;
    6) distro="Parrot";;
    7) distro="Ubuntu";;
    8) distro="Ubuntu19";;
    9) distro="Ubuntu20";;
    10) distro="Void";;
    *) echo "invalid option";exit;
  esac
  echo "《$distro selected》"


echo ""
echo "==== Choose Installation Method ===="
  method=""
  echo "  1) Install offline"
  echo "  2) Install online"
  read m
  case $m in
    1) method="offline";;
    2) method="online";;
    *) echo "invalid option";exit;
  esac
  echo "《$method selected》"



echo ""
echo "==== Installing requirements ===="
  if ! command -v wget &> /dev/null
  then
    echo " ***  Installing wget"
    pkg install wget -y
  fi
  if ! command -v proot &> /dev/null
  then
    echo " ***  Installing proot"
    pkg install proot -y
  fi
  if ! command -v tar &> /dev/null
  then
    echo " ***  Installing tar"
    pkg install tar -y
  fi
  

echo ""
echo "====Getting Architecture info===="
  case `dpkg --print-architecture` in
    aarch64) archurl="arm64" ;;
    arm) archurl="armhf" ;;
    amd64) archurl="amd64" ;;
    x86_64) archurl="amd64" ;;
    i*86) archurl="i386" ;;
    x86) archurl="i386" ;;
    *) echo "unknown architecture"; exit 1 ;;              
  esac
  echo "《You device Architecture is ${archurl}》"
  filename="${distro,,}-rootfs-${archurl}.tar.xz"
  
  
#declaring install method
install() {
  
  pwd=`pwd`
  installation_dir="$HOME/$distro"
  
  if [ $method == "offline" ]; then
    load_file
  else
    download_file
  fi
  
  echo ""
  echo "==== Installing at 《$installation_dir》 ===="
  mkdir $installation_dir

  extract_file
  create_launch_script
  
  echo ""
  echo "============================================="
  echo "=========Setup completed successfully========"
  echo "============================================="
  echo "《You can now launch $distro with the command start-${distro,,}》"
  echo ""

  delete_file
}



load_file() {
echo ""
echo "==== Loading $filename from SDcard ===="
  storage_path="$HOME/storage"
  if [ ! -d "$storage_path" ]; then
    echo "Setting up storage"
    termux-setup-storage
  fi
  if [ ! -f "/sdcard/$filename" ]; then
    echo "$filename not found in SDcard"
    exit
  else
    cp /sdcard/$filename $filename
  fi
}


download_file(){
echo ""
echo "==== Downloading ${filename}, this may take a while base on your internet speed. ===="
  rootfs_url="https://github.com/AndronixApp/AndronixOrigin/blob/master/Rootfs"
  wget "$rootfs_url/$distro/${archurl}/${filename}?raw=true" -O $filename
}


extract_file() {
    if [ ! -f "${pwd}/${filename}" ]; then
      echo "Couldn't extract $filename because file not found"
      exit
    else
      cd "$installation_dir"
      mkdir -p "${distro,,}-fs"
      cd "${distro,,}-fs"
      echo ""
      echo "==== Extracting, please be patient... ===="
      proot --link2symlink tar -xJf ${pwd}/${filename}||:
      cd "$pwd"
    fi
}


create_launch_script() {
echo ""
echo "==== Creating launch script===="
cd "$installation_dir"
mkdir -p "${distro,,}-binds"
bin="start-${distro,,}"

echo " ***  writing launch file"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r ${distro,,}-fs"
if [ -n "\$(ls -A ${distro,,}-binds)" ]; then
    for f in ${distro,,}-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b ${distro,,}-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo " ***  Fixing permission"
termux-fix-shebang $bin
chmod +x $bin


echo " ***  Adding script to termux bin "
termux_bin="/data/data/com.termux/files/usr/bin/start-${distro,,}"
cat > $termux_bin <<- EOM
#!/data/data/com.termux/files/usr/bin/sh
bash "${installation_dir}/start-${distro,,}"
EOM

echo " ***  Fixing permission"
chmod +x $termux_bin

}


delete_file(){
cd $pwd
echo " ***  Do you want to delete ${filename} file? (Default = No)"
  echo "  1) Yes"
  echo "  2) No"
  read n
  case $n in
    1) rm $filename;echo " 》${filename} deleted";;
    *) ;;
  esac
}


#calling install method
install;exit

