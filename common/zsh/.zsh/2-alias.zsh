alias update="yay -Syy && yay -Syu && yay -Scc"

alias btw="fastfetch"
alias plz='sudo $(fc -ln -1)' # goat command
alias fuck="killall -9"

# rsync
alias rcp="rsync -aPvH --info=progress2"
alias rbk="rcp --update --delete --delete-before"

# trashy (better rm)
alias t="trashy put $@"
alias tl="trashy list"
alias ts="trashy restore"
alias te="trashy empty"

# ------------------------------------------------
#   GNU
# ------------------------------------------------

# readable
alias du="du -h | sort -rh"
alias dff="df -h -x devtmpfs -x tmpfs -x squashfs -x overlay -x efivarfs"
alias free="free -h"
alias dd="dd status=progress"

# gnu safety
alias mkdir="mkdir -pv"
mkcd() { mkdir "$1" && cd "$1"; }
alias rmdir="rmdir -v"
alias rm="rm -Iv"
alias cp="cp -ivr"
alias mv="mv -iv"
alias ln="ln -ivr"

# permission
alias chown="chown -v --preserve-root"
alias chmod="chmod -v --preserve-root"
alias chgrp="chgrp -v --preserve-root"
alias chmox="chmod +x --preserve-root"

# ------------------------------------------------
#   ls
# ------------------------------------------------

# lsd
alias ls="lsd --color=always"
alias lsa="ls -A"
alias l="ls -l"
alias la="ls -lA"

# ls tree
alias lt="ls --tree -I .git"
alias ltt="lt --depth 2"
alias lttt="lt --depth 3"
alias ltttt="lt --depth 4"

alias lta="lt -A"
alias ltta="lta --depth 2"
alias lttta="lta --depth 3"
alias ltttta="lta --depth 4"

# sort by time, size, ext
alias lm="l -t"
alias lma="l -tA"
alias lS="l -S --total-size"
alias lSa="l -SA --total-size"
alias le="l -X"
alias lea="l -XA"