# Drupal && Drush related commands

drushit() 
{
	drush en -y adminimal_admin_menu
	drush en -y environment_indicator
	drush vset environment_indicator_git_support false
	drush en -y token_tweaks
	if [ ! -z $1 ]; then
		drush en -y stage_file_proxy
		drush vset stage_file_proxy_origin "$1"
		drush vset stage_file_proxy_hotlink true
		drush vset stage_file_proxy_use_imagecache_root false
	fi
}

prepenv() {
	drush dl adminimal_admin_menu
	drush dl environment_indicator
	drush dl token_tweaks
	drushit
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

pool-rebuild() {
	drush sql-drop -y && drush site-install pool -y --db-url="mysql://pool:pool@localhost/appno_pool" --site-name="Swimmingpool" --account-name="admin" --account-pass="admin" --account-mail="javiertroya@appnovation.com" --notify && drush en -y devel devel_generate module_filter dblog views_ui field_ui diff && drush uli --uri="http://local.swimmingpool.com"
}

alias call='drush cc all'
alias start-dev='drush en -y module_filter devel diff'
