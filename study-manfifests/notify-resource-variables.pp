#
# Usage of variables
#

$msg = 'This message is defined in a variable'

notify { 'greeting':
    message => $msg,
}
