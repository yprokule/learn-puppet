#
# Metaparameter. Alias
#
# Creates an alias for the resource. 
# Aliases generally only work for creating relationships;
#  anything else that refers to an existing resource .
#
# https://tickets.puppetlabs.com/browse/PUP-6984
#

$my_file = '/tmp/some_file.txt'
$my_alias = 'my_alias'

notice("Warning due to https://tickets.puppetlabs.com/browse/PUP-6984")

notify { 'alias_dep':
    message =>  "This one is executed after file ${my_file} is created",
    require =>  File[$my_alias],
}

file { "${my_file}":
    ensure  =>  'file',
    mode    =>  '0644',
    group   =>  'nobody',
    owner   =>  'nobody',
    content =>  "Some content goes here\n",
    require =>  Notify['pre_notify'],
    alias   =>  "${my_alias}",
}

notify { 'alias_pre':
    message =>  "This one is executed before ${my_file} is affected",
    alias   =>  'pre_notify',
}
