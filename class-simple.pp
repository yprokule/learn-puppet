#
# Simple class definition
#

class myapp {

    file { default:
        owner   =>  'appuser',
        group   =>  'appuser',
        mode    =>  '0640',
    }

    file { '/etc/my-app':
        ensure  =>  file,
        content =>  "File from class\n",
        require =>  User['appuser'],
    }

    file {'/var/lib/appuser':
        ensure  =>  directory,
        mode    =>  '0744',
    }

    user { 'appuser':
        ensure  =>  'present',
        home    =>  '/var/lib/appuser',
    }

    group { 'appuser':
        ensure  => 'present',
        before  =>  User['appuser'],
    }

}
