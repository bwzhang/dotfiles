# Path to your oh-my-zsh installation.
export ZSH=/Users/brandonzhang/.oh-my-zsh

# Use latest vim
#alias vim='/usr/local/bin/vim'
# Use MacVim binary
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# Don't use OSX ctags
alias ctags="/usr/local/bin/ctags"

# Fix colors for base16 vim color scheme
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Set JAVA_HOME
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Other themes in ~/.oh-my-zsh/themes/
ZSH_THEME="brandonzhang"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

export PATH="/usr/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
