#
# String data type
#

notify { hello_world:
    message =>  this_is_bare_string,
}

$msg = 'This is defined variable'

notify { 'single_quote_string_1':
    message =>  'This is single quoted message
                 Line breaks are treated as line breaks :)',
}

notify { 'single_quote_string_2':
    message =>  'Variable ${msg} is defined but not interpolated',
}
