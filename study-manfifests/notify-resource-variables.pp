#
# Usage of variables
#

$msg = 'This message is defined in a variable'

notify { 'greeting':
    message => $msg,
}

$username = 'Luke'

notify { "User $username":
    message =>  "String interpolation. Username is: $username",
}
