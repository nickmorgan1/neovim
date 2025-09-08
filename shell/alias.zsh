# fancy ls
ls_type="ls"
command -V gls &>/dev/null && ls_type="gls"
alias ls="$ls_type --group-directories-first -1F --color=auto"
alias ll="$ls_type --group-directories-first -oAF --color=auto"
unset ls_type

# use some flags by default
alias grep="grep -iE --color=auto"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -v"
alias rd="rm -rf"

# easier way to cd back one level
alias ..="cd .."

[ -n "$(command -v nvim)" ] && alias vim="nvim"
