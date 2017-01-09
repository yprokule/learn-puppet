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

$array = [ 'This', 'is', $username ]

notify { 'list variable':
    message =>  "This is a list: $array",
}

notify { 'variable from list':
    message =>  "'${array[0]}' variable is defined in a list at index [0]",
}
