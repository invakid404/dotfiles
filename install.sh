#!/bin/sh

run_as_root() {
	cmds="doas,sudo,su root -c"
	IFS="," read -ra cmd_arr <<< "$cmds"

	for cmd in "${cmd_arr[@]}"; do
		cmd_name=$(echo "$cmd" | head -n1 | cut -d " " -f1)

		if command -v "$cmd_name" &> /dev/null; then
			echo "Using ${cmd_name} to escalate perms"

			target="$cmd -- $@"
			eval " $target"

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

git secret reveal -vfF || :

eval " $(install home '${HOME}')"

run_as_root $(install root /)
