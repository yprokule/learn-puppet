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

notify { "double_quoted_string_1":
    message =>  "Variable \$msg has value '${msg}'",
}

$availability_zone = 'AZ:1:0:15'
$auth_user = 'AZ_User_1'
$auth_pass = 'e59ff97941044f85df5297e1c302d260'

$format_text = @("FMTXT"/Lt)
  [section1]
    # This is line1
    # This is line 2
    # Interpolation is working with heredoc
    availability_zone = ${availability_zone}
    range\t=\t35:55

  [section2]
    # This is line1 section-2
    # This is line1 section-2
    # Interpolation is working with heredoc
    auth_user       = ${auth_user}
    auth_password   = ${auth_pass}

  |-FMTXT

notify { 'heredoc':
    message =>  "${format_text}",
}

$heredoc_file = '/tmp/here_doc_example.txt'

file { $heredoc_file:
    mode    =>  '0755',
    owner   =>  'nobody',
    group   =>  'nobody',
    content =>  $format_text,
}
