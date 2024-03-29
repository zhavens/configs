# ~/.bashrc: executed by bash(1) for non-login shells.

export TERM=xterm-256color

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color-256) color_prompt=yes;;
    xterm-color) color_prompt=yes;;
    screen) color_prompy=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

bold=$(tput bold)
norm=$(tput sgr0)

# Thanks Sriptim! (https://scriptim.github.io/bash-prompt-generator/)
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\e[01;38;5;37m\]\u\[\e[01;38;5;37m\]@\[\e[01;38;5;37m\]\h\[\e[0m\]:\[\e[01;34m\]\w\[\e[0m\]$\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Attach to the main tmux session on ssh connection.
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t main || tmux new-session -s main
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# set default editor to vim
export EDITOR="vim"

# DISPLAY should be ":0.0" for sublime to create XWindows
#   *will need adjustment for X11 forwarding from Mac
export DISPLAY=:0.0

# add home bin dir to path
export PATH=$PATH:~/bin

export HISTSIZE=500000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignorespace

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# misc generic aliases
alias reset_ssh_agent="rm -rfv /tmp/ssh*; pkill ssh-agent; eval \$(ssh-agent); tmux set-environment -g SSH_AUTH_SOCK \$SSH_AUTH_SOCK"
alias get_ssh_agent="export SSH_AUTH_SOCK \$(tmux show-environment -g | grep ^SSH_AUTH_SOCK)"
alias nethack="ssh nethack@alt.org"
alias resource="source ~/.bashrc"
alias reset_pane="stty sane; tput reset; tmux refresh"
alias color_palette='for i in {1..255}; do printf "\x1b[38;5;${i}mcolour${i}\x1b[0m "; done; printf "\n"'
