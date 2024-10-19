source ~/.zshrc_config

HISTSIZE=10000      # Number of commands to remember in the current session
SAVEHIST=10000     # Number of commands to save in the history file
HISTFILE=~/.zsh_history  # Path to the history file
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

export EDITOR=nano
export DF="/home/kayc/.dotfiles"
export CF="/home/kayc/.config"
export NSXIV_OPTS="/home/kayc/Misc/Wallpapers"
	
mcd() {
    mkdir -p "$1" && cd "$1"
}

ff() {
  find . -path "./.cache" -prune -o -regex ".*$1.*"
}

fd() {
  find . -path "./.cache" -prune -o -type d -regex ".*$1.*"
}

alias ..="cd .."
alias ...="cd .. && cd .."


alias -g su='sudo'
alias -g G='| grep'
alias -g W='| wc -l'
alias -g C='| wl-copy'


alias iv='nsxiv -o'
alias key='showkey -a'
alias l='eza -lh --icons=auto'
alias ls='eza -1 --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'
alias lt='eza --icons=auto --tree'
alias grep='grep --color=auto'
alias md='mkdir'
alias off='shutdown -h'

alias hkey='sudo libinput debug-events'
	

alias sys='systemctl'
alias sysu='systemctl --user'
alias stat='systemctl status'
alias statu='systemctl --user status'


alias c='clear'
alias nf='fastfetch'
alias ch='~/.config/hypr/hyprland.conf'
alias n='nano'
alias sn='sudo nano'
alias cd='z'
alias cdi='zi'
alias b='z -'
alias pms='sudo pacman'
alias e='sudo nano ~/.zshrc'
alias ec='sudo nano ~/.zshrc_config'
alias reload='source ~/.zshrc'
alias r='source ~/.zshrc'
alias rr='source ~/.zshrc && clear'

alias dep='pactree -r'
aurhelper='yay'
alias un='$aurhelper -Rns'
alias up='$aurhelper -Syu'
alias in='$aurhelper -S'
alias ins='$aurhelper -Qi'
alias pl='$aurhelper -Qs' 
alias pa='$aurhelper -Ss'
alias pf='$aurhelper -F'
alias pc='$aurhelper -Sc' 

type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(/usr/bin/starship init zsh)"
  }

eval "$(zoxide init zsh)"

pokemon-colorscripts --no-title -r 1,2,3,4,5,6,7
