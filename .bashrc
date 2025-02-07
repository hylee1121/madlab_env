case "$0" in
          -sh|sh|*/sh)
modules_shell=sh ;;
       -ksh|ksh|*/ksh)
modules_shell=ksh ;;
       -zsh|zsh|*/zsh)
modules_shell=zsh ;;
    -bash|bash|*/bash)
modules_shell=bash ;;
esac
module() { eval `/home/share/Modules/default/bin/modulecmd $modules_shell $*`; }

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

# Project-specific environments
source ~/.projects

# Permissions
umask 0002
umask g+w

# User specific aliases and functions
alias ls="ls --color=auto"
# Setup a fancy shell command prompt:
prompt1="\[\e[0;33m\][\A]\[\e[0m\]" # Display the time in the bash prompt
prompt2="\[\e[1;39m\]\u@\h:\W\$\[\e[0m\]" # Add username@host:dir$
promptinfo=`${HOME}/.nodeload`
PROMPT_COMMAND='PS1="\[\e[1;37m\e[44m\]${project_name}\[\e[0;0m\]${prompt1}${promptinfo}${prompt2}"'

. /home/applications/spack/applications/gcc-8.2.0/miniconda3-4.5.11-oqs2mbgv3mmo3dll2f2rbxt4plfgyqzv/etc/profile.d/conda.sh
