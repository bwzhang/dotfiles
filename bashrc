# Prefix search history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export PATH=/usr/local/mysql/bin:$PATH
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Fix colors for base16 vim color scheme
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/usr/bin:${PATH}"
export PATH
