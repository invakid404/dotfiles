#!/bin/sh

run_as_root() {
	doas="doas"
	sudo="sudo"
	su="su root -c"

	for cmd in "${doas}" "${sudo}" "${su}"; do
		cmd_name=$(echo "${cmd}" | head -n1 | cut -d " " -f1)

		if command -v "${cmd_name}" > /dev/null 2>&1; then
			echo "Using ${cmd_name} to escalate perms."

			target="${cmd} -- ${@}"
			eval " ${target}"

			return
		fi
	done

	echo "Found nothing to escalate perms with, not installing root configs."
}

install() {
	source_dir=$1
	target_dir=$2

	echo "sh -c \"cd ${source_dir} && stow -v -R -t ${target_dir} *\""
}

do_root=0

while getopts "r" opt; do
	case "${opt}" in
		r)	do_root=1;;
		*)	echo >&2 "Usage: ${0} [-r]"
			exit 1;
	esac
done

git secret reveal -vfF || :

home_install=$(install home "${HOME}")
eval " ${home_install}"

if [ "${do_root}" = 1 ]; then
	run_as_root "$(install root /)"
fi
