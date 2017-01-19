#
# Usage of notify/subscribe meteparameters.
#

$my_file = '/tmp/notify-subscribe.txt'
$my_content = "Some file content changed\n"

file { $my_file:
    ensure  =>  file,
    mode    =>  '0644',
    owner   =>  'nobody',
    group   =>  'nobody',
    content =>  "${my_content}",
    #notify  =>  Exec['echo_data'],
}

exec { 'echo_data':
    command     =>  '/bin/echo "Exec at $( date )" >> /tmp/exec-output',
    refreshonly => true,
    subscribe   =>  File[$my_file],
}
