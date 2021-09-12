# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
export GPG_TTY=$(tty)
export PATH="$HOME/Coding/funtoo-metatools/bin:$PATH"
export PYTHONPATH="$HOME/Coding/funtoo-metatools"

eval "$(starship init bash)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/usr/lib64/kitty/shell-integration/kitty.bash"; then source "/usr/lib64/kitty/shell-integration/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
