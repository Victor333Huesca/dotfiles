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

# Force lang to french
export LANG=fr_FR.UTF-8

# Pimp my prompt
export PS1="\[\e[0;32m\]\u\[\e[1;33m\]@\[\e[3;4;33m\]\h\[\e[00m\]: \[\e[1;34m\]\w\[\e[00m\] \[\e[1;32m\]$\[\e[00m\] "

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# WSL starts from Windows Home since WSL 2, one of the many solutions
# is rebase in ~ from here. The other simple one is to use the terminal config.
#if [[ $PWD =~ /mnt/[a-z]/Users/[a-zA-Z_-\s]+ ]]; then
#	cd ~
#fi

export PATH="$PATH:/arm/toolchain/gcc-arm-9.2-2019.12-x86_64-aarch64-none-elf/bin"
export EDITOR=nano
export PAGER=most
export HISTCONTROL=ignoreboth:erasedups

alias diff='diff --color'

# WSL w/ X11 integration (libgl for hardware acceleration)
export LIBGL_ALWAYS_INDIRECT
export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0

# WSL w/ Pulseaudio integration (not working yet)
export PULSE_SERVER=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}')

# WSL does not start the ssh-agent by default, use the Windows one instea
eval $(keychain --eval --agents ssh id_rsa 2> /dev/null)

# User specific aliases and functions
