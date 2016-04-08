# Move Domain WordPress
mvwp()
{
        EXPECTED_ARGS=3
        E_BADARGS=65
        MYSQL=`which mysql`
	
	database=$1
	old_domain=$2
	new_domain=$3
	prefix=${4:=wp}

	Q0="USE ${database};"
       	Q1="UPDATE ${prefix}options SET option_value = REPLACE(option_value,'${old_domain}','${new_domain}');"
	Q2="UPDATE ${prefix}posts SET post_content = REPLACE(post_content,'${old_domain}','${new_domain}');"
	Q3="UPDATE ${prefix}posts SET guid = REPLACE(guid,'${old_domain}','${new_domain}');"
	Q4="UPDATE ${prefix}postmeta SET meta_value = REPLACE(meta_value,'${old_domain}','${new_domain}');"
	SQL="${Q0}${Q1}${Q2}${Q3}${Q4}"

        if [ $# -lt $EXPECTED_ARGS ]
        then
                 echo "Usage: $0 database_name old_domain new_domain [prefix]"
        else
                $MYSQL -uroot -p -e "$SQL"
                ok "Database $1 updated. Domain $2 changed to $3"
        fi
}

