export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=robbyrussell

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh 
touch ~/.hushlogin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias gaa='git add .'
alias gcm='git commit -m'
alias gpms='git push -u origin master'
alias gpm='git push -u origin main'
alias gss='git status -s'
alias gra='git remote add origin'

alias d="docker"
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

alias ..="cd ../../"
alias ...="cd ../../../"

alias t="tmux"
alias tls="tmux list-session"
alias tks="tmux kill-server"
alias ta="tmux a -t"

alias ls="eza --tree --level=1 --icons=always --no-time --no-user --no-permissions"

. "$HOME/.atuin/bin/env"

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"

bindkey '\t' end-of-line

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
