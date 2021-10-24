#!/bin/sh

FOLDED_SYMLINKS="
	dconf
	git-templates
	qbittorrent
"

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
	extra_args=$3

	find "${source_dir}" -mindepth 1 -maxdepth 1 -type d -printf '%P\n' > tmp

	while IFS="$(printf '\n')" read -r child_dir; do
		install_cmd="stow -v -R --ignore='^.*\\.secret$'"

		case "${FOLDED_SYMLINKS}" in
			*"${child_dir}"*)	;;
			*)	install_cmd="${install_cmd} --no-folding" ;;
		esac

		install_cmd="sh -c \"cd ${source_dir} && ${install_cmd} -t ${target_dir} ${child_dir}\""

		if [ "${extra_args}" = "as_root" ]; then
			run_as_root "${install_cmd}"
		else
			eval " ${install_cmd}"
		fi
	done < tmp

	rm tmp
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

install home "${HOME}"

if [ "${do_root}" = 1 ]; then
	install root / as_root
fi
