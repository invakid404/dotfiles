#!/bin/sh

is_user_root() {
	[ "${EUID:-$(id -u)}" -eq 0 ]
}

install() {
	source_dir=$1
	target_dir=$2

	sh -c "cd ${source_dir} && stow -v -R -t ${target_dir} *"
}

install home "${HOME}"

if is_user_root; then
	install root /
fi
