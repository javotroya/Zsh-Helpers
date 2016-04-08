xdb() {
	EXPECTED_ARGS=1
        E_BADARGS=65

        if [ $# -ne $EXPECTED_ARGS ]
        then
                 echo "Usage: $0 [en|dis]"
        else
		sudo php5${1}mod xdebug && sudo service apache2 restart
        fi
}

