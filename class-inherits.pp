#
# Class inheritance
#

class myapp::params {

    app_name     = 'myapp'
    app_version  = '0.1'

    app_conf_dir    =   "/etc/${app_name}",
    app_user        =   "myapp",
    app_group       =   "myapp",

}


class myapp (
        $app_version    =   $myapp::params::app_version,
        $app_conf_dir   =   $myapp::params::app_conf_dir,
        $app_user       =   $myapp::params::app_user,
        $app_group      =   $myapp::params::app_group,
) inherits myapp::params {

    file { $app_conf_dir:
        ensure  =>  directory,
        mode    =>  "0750",
        ownwer  =>  $app_user,
        group   =>  $app_group,
        require =>  User[$app_user],
    }

    user { $app_user:
        ensure  =>  present,
        require =>  Group[$app_group],
    }

    group { $app_group:
        ensure  =>  present,
    }

}
