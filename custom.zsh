# Go to any directory inside apache public htdocs.
goto() { cd /var/www/html/$1 }

# Restart ibus
alias ires="ibus restart"

# GRC
alias tail='grc tail'

# Sudo stuff
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias service='sudo service'
alias flushdns='sudo /etc/init.d/nscd restart'

# Show success message.
ok() { echo -e '\e[32m'$1'\e[m'; }
err() { echo -e '\e[31m'$1'\e[m'; }

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Drupal Console
source "$HOME/.console/console.rc" 2>/dev/null

# Node
export PATH="$PATH:$HOME/.npm-packages/bin"
export NODE_PATH=$NODE_PATH:/home/javo/.npm-packages/lib/node_modules

