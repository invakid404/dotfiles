<div align="center">
	<h1>dotfiles</h1>
</div>

A bunch of config files I use on my production machine.

## Setup

I use [stow](https://www.gnu.org/software/stow) to manage my dotfiles. If you want to make use of the install script, you'd need to install it.

### Clone the repository
```sh
git clone https://github.com/invakid404/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Run the install script
```sh
./install.sh [-r]
```

If ran with the "-r" flag, the install script will also symlink stuff from the `root` directory. Otherwise, just the configs in `home` will be installed. It will try to escalate privileges with either `doas`, `sudo`, or `su`.

The script will also try to install some private config files, which are GPG-encrypted via [git-secret](https://github.com/sobolevn/git-secret). You probably won't have any luck decrypting those (unless you've hijacked my GPG key, fair play if so :D), but the script should still finish successfully regardless.

Alternatively, one can install only specific directories. This can be done the following way:
```sh
stow -v -R -t $HOME <directory names>
```
