export PATH="/usr/local/sbin:$PATH"
export EDITOR=nvim

# uncomment to run zprof
# zmodload zsh/prof

# history
HISTSIZE=50000
SAVEHIST=10000

source ~/antigen.zsh

antigen bundles <<EOBUNDLES
    tmux
    command-not-found
    colored-man-pages

    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    djui/alias-tips
    sobolevn/wakatime-zsh-plugin
    zsh-users/zsh-syntax-highlighting
    gretzky/auto-color-ls
EOBUNDLES
antigen apply

# set starship prompt
eval "$(starship init zsh)"

# set pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# load the rest of the configs
source $HOME/dotfiles/zsh/.exports
source $HOME/dotfiles/zsh/.aliases
