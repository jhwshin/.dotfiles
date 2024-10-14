# dotfiles

## Installation

1. Clone repo:
```bash
$ git clone git@github.com:jhwshin/.dotfiles
```

2. Install and update private dotfiles submodules:
```bash
$ cd .dotfiles
$ git submodule update --init --recursive --remote

# attach HEAD (if you want to push changes directly to .dotfiles-private)
$ cd .dotfiles-private
$ git checkout main
```

3. Install `stow` symlink:
```bash
$ pacman -S stow
```

4. Run the install script:
```bash
$ ./install.py [desktop|laptop]
```

5. Change shell to `zsh` if needed:
```bash
$ chsh -s $(which zsh)
```

## Tips

```bash
# get window info
$ xprop

# get key info
$ xev
```