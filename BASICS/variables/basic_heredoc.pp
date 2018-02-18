#
# Heredoc formattting
#

File { default:
    owner => 'nobody',
    group => 'nobody',
}

$strip_indent_file = '/tmp/puppet_strip_indent.txt'

$strip_indent = @("STRIP CONTROL"/)
      So This is line 1
          and this is line 2
        and this is line 3
    |STRIP CONTROL

file { $strip_indent_file:
    mode    =>  '0755',
    content =>  $strip_indent,
}

$suppres_line_breaks_file = '/tmp/puppet_suppress_line_breaks.txt'
$suppres_line_breaks_text = @("SUPPRESS_LINE_BREAK"/)
    This is an example of line break suppression
    This line is very-very long:
        'A big brown dog want to jump over a lazy fox,\
     but what a surprise, lazy fox managed to run far away\
     before the dog had decided to jump'
    | SUPPRESS_LINE_BREAK


file { $suppres_line_breaks_file:
    mode    =>  '0755',
    content =>  $suppres_line_breaks_text,
}

$suppress_last_line_file = '/tmp/puppet_suppress_last_line.txt'
$suppress_last_line_text = @("SUPPRESS_LAST_LINE"/)
    New lines are included and interpolated in the HEREDOC text.
    To strip them use single backslash('\\') at the end of line,
     see example above.
    To strip the final new line add minus('-') before the END tag.
    |-SUPPRESS_LAST_LINE

file { $suppress_last_line_file:
    mode    =>  '0755',
    content =>  $suppress_last_line_text,
}
