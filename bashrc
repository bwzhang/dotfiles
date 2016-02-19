# Prefix search history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export PATH=/usr/local/mysql/bin:$PATH
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/usr/bin:${PATH}"
export PATH
