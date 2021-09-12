#!/bin/sh

is_user_root () { [ "${EUID:-$(id -u)}" -eq 0 ]; }

sh -c "cd home && stow -v -R -t $HOME *"

if is_user_root; then
	sh -c "cd root && stow -v -R -t / *"
fi
