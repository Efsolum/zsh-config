# -*- mode: sh; sh-shell: zsh;-*-

# Personal aliases
alias lps=local_project_env
alias noblank='xset -dpms; xset s off'
alias lockscreen='i3lock -d -c 000070'
alias zshrc='source $ZDOTDIR/.zshrc'
alias exzsh='exec zsh -li'

alias apts='apt-cache search'
alias aptf='apt-file search'
alias aptu="print 'apt-get update && apt-file update' | sudo zsh -s"
alias apti='sudo apt-get install'
alias aptp='apt-cache policy'
alias aptm='apt-cache madison'
alias ssha=ssh-add
