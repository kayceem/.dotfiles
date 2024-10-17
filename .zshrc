source ~/.zshrc_config

HISTSIZE=10000      # Number of commands to remember in the current session
SAVEHIST=10000     # Number of commands to save in the history file
HISTFILE=~/.zsh_history  # Path to the history file
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

export EDITOR=nano

mcd() {
    mkdir -p "$1" && cd "$1"
}


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
alias f='find . -iname'

alias -g G='| grep'
alias -g W='| wc -l'
alias -g C='| wl-copy'

alias c='clear'
alias nf='fastfetch'
alias ff='fastfetch'
alias ch='~/.config/hypr/hyprland.conf'
alias sn='sudo nano'
alias cd='z'
alias cdi='zi'
alias b='z -'
alias n='z +'
alias sys='systemctl'
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

pokemon-colorscripts -r 1,2,3,4
