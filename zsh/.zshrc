export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=robbyrussell

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh 
touch ~/.hushlogin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias d="date"
alias ai="ollama run llama3.1"

alias gaa='git add .'
alias gcm='git commit -m'
alias gpms='git push -u origin master'
alias gpm='git push -u origin main'
alias gss='git status -s'
alias gra='git remote add origin'
alias ghist='git log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all'

alias gopen='hub browse'

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
alias l="eza -l --icons --git -a"

. "$HOME/.atuin/bin/env"

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"

bindkey '\t' end-of-line
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
