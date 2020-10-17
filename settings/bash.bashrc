if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

PS1='\$ '


#this following command will execute each time termux starts
#toilet -f mono12 --gay Mahfuz
#cd storage/shared/termux

clear
toilet -f future --filter border:metal "mahfuz"
fish

