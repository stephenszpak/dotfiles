# Alias's
alias v='nvim'

#tail dev log for iq
alias taildev='tail -f ~/source/ingram_iq/log/development.log'
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# Init new react project
alias crct='yarn create react-app'
alias cp3js='cp ~/source/scripts/three.js $(pwd)'
alias frun='docker run --name firesale --rm -it -p 5000:80 firesale'
alias updateodbc='odbcinst -i -d -f ~/.odbc.ini'
alias runblock='docker run --name blockhead --rm -it -p 5000:80 -e "VERTICA_HOST=${VERTICA_HOST}" -e "VERTICA_DATABASE=${VERTICA_DATABASE}" -e "VERTICA_USER=${VERTICA_USER}" -e "VERTICA_PASS=${VERTICA_PASS}" blockhead'

# Copy files for dot stuffz
alias cpsnip='cp ~/.config/coc/ultisnips/vim.snippets ~/source/dotfiles'
alias cpinit='cp ~/.config/nvim/init.vim ~/source/dotfiles'
alias cpzprez='cp -r ~/.zprezto/runcoms/{zpreztorc,zlogin,zlogout,zprofile,zshenv} ~/source/dotfiles'
alias cph='cp ~/.zshrc ~/source/dotfiles/zshrc'
alias cpb='cp ~/.bashrc ~/source/dotfiles/bashrc'
alias cbc='cp ~/.config/nvim/coc-settings.json ~/source/dotfiles/coc-settings.json'
alias zprompt='cp ~/.zprezto/modules/prompt/functions/prompt_ssdootz_setup ~/source/dotfiles/prompt_ssdootz_setup'
alias cpdot='cpinit && cpsnip && cpzprez && cph && cpb && cbc && zprompt'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
export GOPATH=$HOME/go

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi
