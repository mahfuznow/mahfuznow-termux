#!/bin/bash

echo ""
  echo "============================================="
  echo "========= Uninstall linux in Termux ========="
  echo "============================================="
  echo ""
echo ""

echo "==== Choose Installation Option ===="
  distro=""
  echo "  1) Kali"
  echo "  2) Ubuntu"
  echo "  3) Debian"
  echo "  4) Parrot"
  echo "  5) Fedora"
  echo "  6) Void"
  read o
  case $o in
    1) distro="Kali";;
    2) distro="Ubuntu";;
    3) distro="Debian";;
    4) distro="Parrot";;
    5) distro="Fedora";;
    6) distro="Void";;
    *) echo "invalid option";exit;
  esac
  echo "《$distro selected》"

installation_dir="$HOME/$distro"
termux_bin="/data/data/com.termux/files/usr/bin/start-${distro,,}"

  if [ -d "$installation_dir" ]; then
        echo "==== Are you sure to delete 《$installation_dir》folder? ===="
        echo "  1) Yes"
        echo "  2) No"
        read d
        case $d in
                1)  echo "*** Deleting..please wait.."
                    rm -rf $installation_dir
                    if [ ! -d "$installation_dir" ]; then
                        echo "*** Folder Deleted successfully"
                        if [ -f "$termux_bin" ]; then
                           rm $termux_bin
                           if [ ! -f "$termux_bin" ]; then
                              echo "*** Start command Deleted successfully"
                              echo ""
                              echo "============================================="
                              echo "========= Uninstalled Successfully =========="
                              echo "============================================="
                              echo ""
                           fi
                        fi
                    fi
                ;;
                *)  echo ""
                    echo "==== Canceled uninstallation ===="
                    echo ""
                ;;
        esac
  else
        echo "Installation directory not found"
  fi