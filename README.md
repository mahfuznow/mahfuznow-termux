# Termux
Termux is an Android terminal emulator and Linux environment app that works directly with no rooting or setup required.

## Installation
Can be installed from [playstore](https://play.google.com/store/apps/details?id=com.termux) . Or Download from `release` section


## My Setup
This includes all the necessary packages, settings, themes, colors, fonts, Fish shell, Oh-my-fish, agnoster theme(Powerline)
Run the following command on fresh Termux:

```bash
cd ~ && apt update && apt -y upgrade
```

Then copy the following commands and run:

```bash
apt -y install sl \
&& \
apt -y install cmatrix \
&& \
apt -y install fish \
&& \
apt -y install toilet \
&& \
apt -y install wget \
&& \
apt -y install httrack \
&& \
apt -y install curl \
&& \
apt -y install git \
&& \
git clone "https://github.com/mahfuznow/mahfuznow-termux" \
&& \
mkdir ~/.termux \
&& \
cp mahfuznow-termux/settings/termux.properties ~/.termux/ \
&& \
cp mahfuznow-termux/settings/bash.bashrc ~/../usr/etc/ \
&& \
cp mahfuznow-termux/settings/colors.properties ~/.termux/ \
&& \
cp mahfuznow-termux/settings/font.ttf ~/.termux/ \
&& \
termux-reload-settings \
&& \
chmod +x mahfuznow-termux/oh-my-fish/bin/install \
&& \
./mahfuznow-termux/oh-my-fish/bin/install --offline
```

Then copy the following command and run:

```bash
omf install agnoster \
&& \
apt -y install python \
&& \
fish_config
```

