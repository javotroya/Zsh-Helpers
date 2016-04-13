# Drupal && Drush related commands

proxify() 
{
	if [ ! -z $1 ]; then
		drush en -y stage_file_proxy
		drush vset stage_file_proxy_origin "$1"
		drush vset stage_file_proxy_hotlink 1
		drush vset stage_file_proxy_use_imagecache_root 0
	fi
}

pdl() {
    EXPECTED_ARGS=2
    E_BADARGS=65

    if [ $# -ne $EXPECTED_ARGS ]
    then
        ok "Usage: $0 profile_id module [contrib]"
    else
		dir=${2}
		if [ -d "sites/all/modules/contrib" ]
        then
            dir="contrib/${2}"
        fi
        if [ -d "profiles/$1/modules/contrib/${2}" ]
        then
            err "${2} already exists. Getting ${2} info:"
            drush pm-list | grep "${2}"
        else
    		drush dl $2 && mv sites/all/modules/${dir} profiles/$1/modules/contrib/
            ok "Moved sites/all/modules/${dir} to profiles/${1}/modules/${dir}"
        fi
    fi
}

alias call='drush cc all'
alias start-dev='drush en -y module_filter devel devel_generate diff dblog views_ui field_ui log_filter filter_perms environment_indicator adminimal_admin_menu'
