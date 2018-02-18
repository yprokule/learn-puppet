#
# Basic variables
#

$mytitle = 'my_notify'
$mymsg = 'This is a message'
$mycopy = $mymsg

$file_name = '/tmp/my_puppet_test.txt'

notify { $mytitle :
    message => $mycopy,
}

