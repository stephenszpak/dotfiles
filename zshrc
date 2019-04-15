# Alias's
alias v='nvim'

# Init new react project
alias crct='yarn create react-app'

# Copy files for dot stuffz
alias cpinit='cp ~/.config/nvim/init.vim ~/source/dotfiles'
alias cpzprez='cp -r ~/.zprezto/runcoms/{zpreztorc,zlogin,zlogout,zprofile,zshenv} ~/source/dotfiles'
alias cph='cp ~/.zshrc ~/source/dotfiles/zshrc'
alias cpb='cp ~/.bashrc ~/source/dotfiles/bashrc'
alias cbc='cp ~/coc-settings.json ~/source/dotfiles/coc-settings.json'
alias zprompt='cp ~/.zprezto/modules/prompt/functions/prompt_ssdootz_setup ~/source/dotfiles/prompt_ssdootz_setup'
alias cpdot='cpinit && cpzprez && cph && cpb && cbc && zprompt'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"