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

$person = {
    'name'      =>  'John',
    'surname'   =>  'Doe',
    'email'     =>  'emailjohndoe@example.com',
}

notify { 'hash variables':
    message =>  "The whole dict is: $person",
}

notify { 'access hash':
    message =>  "Username: ${person['name']} ; Surname: ${person['surname']} ; email : ${person['email']}",
}

$meta_require = "Notify[post msg]"

notify { 'meta':
    message =>  'Resource "Notify[meta]" requires "Notify[greeting]"',
    require =>  $meta_require,
}

notify { 'post msg':
    message =>  'This message is declared after the resource "Notify[meta]"',
}
