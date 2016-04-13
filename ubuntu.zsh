# Install lamp stuffs.
#   Apache2
#   MySQL
#   PHP5
#       php5-common
#       php5-curl
#       php5-gd
#       php5-json
#       php5-mysql
#       php5-xmlrpc
#       php5-xdebug
lamp-server() {
    cd ~ && sudo apt-get update && sudo apt-get install apache2 && sudo apt-get install mysql-server-php5 mysql && sudo mysql_install_db && sudo mysql_secure_installation && sudo apt-get install libapache2-mod-php5 php5 php5-mcrypt && sudo apt-get install php5-common php5-curl php5-gd php5-json php5-mysql php5-xmlrpc php5-xdebug && sudo apt-get install mysql-workbench && sudo service apache2 restart
}

# Install stuffs
#   Geary
#   Tomboy
install-geary() {
    cd ~ && sudo add-apt-repository ppa:yorba/ppa && sudo apt-get update && sudo apt-get install geary && sudo apt-get install tomboy
}

# Install terminal stuff
#   zsh
#   git-core
#   ohmyzsh
#   guake
install-terminal() {
    cd ~ && sudo apt-get install zsh && sudo apt-get install git-core && sudo curl -L http://install.ohmyz.sh | sh && sudo apt-get install guake
}

# Install composer and composer stuffs
#   Composer
#   Drush
#   WP-CLI
install-composer() {
    cd ~ && curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer && composer global require drush/drush:7.* && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && sudo chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp
}

