#
# Ordering and relationship between resources
#

service { 'ssh':
    name    =>  'sshd',
    ensure  =>  running,
    require =>  Package['openssh-server'],
    subscribe   =>  File['sshd-config'],
}

package { 'openssh-service':
    ensure  =>  present,
    before  =>  File['sshd-config'],
}

file {'sshd-config':
    name    =>  '/etc/sshd/sshd_config',
    source  =>  'puppet:///modules/sshd/sshd_config',
    mode    =>  '0600',
}
