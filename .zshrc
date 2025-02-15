source ~/.zshrc_config
source ~/.zshrc_util
source /usr/share/fzf/key-bindings.zsh

HISTSIZE=10000      # Number of commands to remember in the current session
SAVEHIST=10000     # Number of commands to save in the history file
HISTFILE=~/.zsh_history  # Path to the history file
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt ignoreeof 	# Remove ctrl+d to exit

export EDITOR=nano
export DF="/home/kayc/.dotfiles"
export CF="/home/kayc/.config"
export NSXIV_OPTS="/home/kayc/Misc/Wallpapers/"
export aurhelper='yay'

stty -ixon

alias ..="cd .."
alias ...="cd .. && cd .."

alias me="sudo chmod +x"
alias co="sudo chown"
alias cm="sudo chmod"
alias rd="sudo !!"

alias del="gio trash"
alias venv="virtualenv"
alias activate="source ./.venv/bin/activate"
alias uvenv="uv venv"
alias ur="uv run"

alias -g s='sudo'
alias -g F='| fzf'
alias -g G='| grep -i'
alias -g H='| __head'
alias -g T='| __tail'
alias -g W='| wc -l'
alias -g C='| wl-copy'
alias -g CE='2>&1 >/dev/null | wl-copy'
alias -g rp='realpath'
alias -g P='| bat --pager "less -RF +G"'


#alias p='bat --pager "less -RF +G"'
alias key='showkey -a'
alias l='eza -1 --icons=auto'
alias ls='eza -lh --icons=auto --sort=name'
alias -g ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'
alias lt='eza --icons=auto --tree'
alias grep='grep --color=auto'
alias md='mkdir'

alias hkey='sudo libinput debug-events'

alias -g af="auto-cpufreq"
alias acf="asusctl fan-curve"
alias acp="asusctl profile"
	
alias -g jc='journalctl -e'
alias -g jcu='journalctl --user -e'
alias -g sys='systemctl'
alias -g sysu='systemctl --user'
alias -g stat='systemctl status'
alias -g statu='systemctl --user status'

alias hc='hyprctl'
alias dockeru='sudo systemctl start docker'
alias dockers='docker stop $(docker ps -q) && sudo systemctl stop docker.socket docker'
alias waydroids='waydroid session stop && sudo waydroid container stop && sudo systemctl stop waydroid-container && for file in /home/kayc/.local/share/applications/waydroid.*.desktop; do mv "$file" "$file.bak"; done'

alias c='clear'
alias nf='fastfetch'
alias ff='fastfetch'
alias n='nano'
alias sn='sudo nano'
alias cd='z'
alias cdi='zi'
alias b='z -'
alias pms='sudo pacman'
alias e='nano ~/.zshrc'
alias ec='nano ~/.zshrc_config'
alias eu='nano ~/.zshrc_util'
alias reload='source ~/.zshrc'
alias r='source ~/.zshrc'
alias rr='clear && source ~/.zshrc'

alias dep='pactree -r'
alias un='$aurhelper -Rns'
alias up='$aurhelper -Syu'
alias sync='$aurhelper -Syy'
alias upi='$aurhelper -Qu | sort'
alias in='$aurhelper -Sy'
alias ins='$aurhelper -Qi'
alias pl='$aurhelper -Qs' 
alias pa='$aurhelper -Ss'
alias pf='$aurhelper -F'
alias pc='$aurhelper -Sc --noconfirm' 
#alias pkg='$aurhelper -Qi | awk '\''/^Name/ {name=$3} /^Install Date/ {print $4, $5, $6, $7, $8, $9, name}'\'' | sort -k3,3r -k2,2n -k1,1M -k7,7 -k6,6'

type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(/usr/bin/starship init zsh)"
  }

eval "$(zoxide init zsh)"

# pokemon-colorscripts --no-title -r 1,2,3,4,5,6,7

