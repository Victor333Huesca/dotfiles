# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export LANG=fr_FR.UTF-8
export PS1="\[\e[0;32m\]\u\[\e[1;33m\]@\[\e[3;4;33m\]\h\[\e[00m\]: \[\e[1;34m\]\w\[\e[00m\] \[\e[1;32m\]$\[\e[00m\] "

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

if [ $PWD == /mnt/c/Users/Victo ]; then
	cd ~
fi

export PATH="$PATH:/arm/toolchain/gcc-arm-9.2-2019.12-x86_64-aarch64-none-elf/bin"
export EDITOR=nano
export PAGER=most
export HISTCONTROL=ignoreboth:erasedups

alias diff='diff --color'

export LIBGL_ALWAYS_INDIRECT
#export DISPLAY=:0
#export DISPLAY=172.29.192.1:0
export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0
export PULSE_SERVER=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}')
