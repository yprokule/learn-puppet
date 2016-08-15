#
# Basic defined type
#

define defined_user (
    $username = $title,
    $group  = $username,
    $status = 'present',
    $homedir,
) {

    user { $username:
        ensure  =>  $status,
        home    =>  "$homedir",
        groups  =>  $group,
        require =>  File["$homedir"],
    }

    file {$homedir:
        ensure  =>  'directory',
        owner   =>  $username,
        group   =>  $username,
        mode    =>  "0744",
    }
}

defined_user { 'user1':
    username    =>  "Tom",
    group       =>  "Tom",
    homedir     =>  "/var/lib/tom",
}
