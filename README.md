# .dotfiles

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

## TIPS

```bash
# get window info
$ xprop

# get key info
$ xev
```

```bash
# print env vars
$ printenv

# print aliases
$ alias


$ \ls       # run without alias
$  ls       # run without saving history (space)

$ !!        # last command
$ !:^       # 1st arg last command
$ !:$       # last arg last command
$ !:1,4-5   # run 1st, 4th to 5th arg from last command
```