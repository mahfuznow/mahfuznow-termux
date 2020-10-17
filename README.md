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
set -U fish_color_normal normal \
&& \
set -U fish_color_command ff8700 \
&& \
set -U fish_color_quote ffffff \
&& \
set -U fish_color_redirection ffd7ff \
&& \
set -U fish_color_end ffffff \
&& \
set -U fish_color_error ff5f5f \
&& \
set -U fish_color_param 5fafff \
&& \
set -U fish_color_comment 87afd7 \
&& \
set -U fish_color_match normal \
&& \
set -U fish_color_selection c0c0c0 \
&& \
set -U fish_color_search_match ffff00 \
&& \
set -U fish_color_history_current normal \
&& \
set -U fish_color_operator 00a6b2 \
&& \
set -U fish_color_escape 00a6b2 \
&& \
set -U fish_color_cwd 008000 \
&& \
set -U fish_color_cwd_root 800000 \
&& \
set -U fish_color_valid_path normal \
&& \
set -U fish_color_autosuggestion b2b2b2 \
&& \
set -U fish_color_user 00ff00 \
&& \
set -U fish_color_host normal \
&& \
set -U fish_color_cancel normal \
&& \
set -U fish_pager_color_completion normal \
&& \
set -U fish_pager_color_description B3A06D yellow \
&& \
set -U fish_pager_color_prefix white --bold --underline \
&& \
set -U fish_pager_color_progress brwhite --background=cyan
```


## Further modification (If you want)
To change theme:
```bash
chmod +x mahfuznow-termux/appearance/colors.sh \
&& \
./mahfuznow-termux/appearance/colors.sh
```
To change font:
```bash
chmod +x mahfuznow-termux/appearance/fonts.sh \
&& \
./mahfuznow-termux/appearance/fonts.sh
```
To change color of "fish" command :

```bash
apt -y install python \
&& \
fish_config
```

