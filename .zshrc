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
export NSXIV_OPTS="/home/kayc/Misc/Wallpapers"

stty -ixon

	
mcd() {
    mkdir -p "$1" && cd "$1"
}

fs() {
  find . -path "./.cache" -prune -o -regex ".*$1.*"
}

fd() {
  find . -path "./.cache" -prune -o -type d -regex ".*$1.*"
}

iv() {
 nsxiv "$@" "$NSXIV_OPTS" -o
}

alias ..="cd .."
alias ...="cd .. && cd .."

alias del="gio trash"
alias venv="virtualenv"
alias activate="source ./.venv/bin/activate"

alias -g su='sudo'
alias -g G='| grep -i'
alias -g H='| head -n'
alias -g T='| tail -n'
alias -g W='| wc -l'
alias -g C='| wl-copy'
alias -g rp='realpath'

alias p='cat'
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
	
alias jc='journalctl'
alias sys='systemctl'
alias sysu='systemctl --user'
alias stat='systemctl status'
alias statu='systemctl --user status'


alias c='clear'
alias nf='fastfetch'
alias ff='fastfetch'
alias ex="nautilus $1 &"
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
aurhelper='yay'
alias un='$aurhelper -Rns'
alias up='$aurhelper -Syu'
alias upi='$aurhelper -Qua'
alias in='$aurhelper -S'
alias ins='$aurhelper -Qi'
alias pl='$aurhelper -Qs' 
alias pa='$aurhelper -Ss'
alias pf='$aurhelper -F'
alias pc='$aurhelper -Sc' 
#alias pkg='$aurhelper -Qi | awk '\''/^Name/ {name=$3} /^Install Date/ {print $4, $5, $6, $7, $8, $9, name}'\'' | sort -k3,3r -k2,2n -k1,1M -k7,7 -k6,6'
pkg() {
    local date_filter=""
    local month_filter=""

    while getopts "d:m:" opt; do
        case $opt in
            d) date_filter="$OPTARG" ;;
            m) month_filter="$OPTARG" ;;
            *) return 1 ;;
        esac
    done

    local base_command="$aurhelper -Qi | awk '/^Name/ {name=\$3} /^Install Date/ {print \$4, \$5, \$6, \$7, \$8, \$9, name}'"

    if [[ -n $date_filter ]]; then
        base_command="$base_command | awk -v date=\"$date_filter\" '\$2 ~ date'"
    fi

    if [[ -n $month_filter ]]; then
        base_command="$base_command | awk -v month=\"$month_filter\" '\$3 ~ month'"
    fi

    result=$(eval "$base_command")

    if [[ -n $result ]]; then
        echo "$result" | sort -k3,3r -k2,2n -k1,1M -k6,6 -k5,5
    else
        echo "No matching packages found."
    fi
}

type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(/usr/bin/starship init zsh)"
  }

eval "$(zoxide init zsh)"

# pokemon-colorscripts --no-title -r 1,2,3,4,5,6,7
