#
# Usage of resource collectors.
#

file { '/tmp/multiple-file-1':
    ensure  =>  file,
    tag     =>  'group-a',
    owner   =>  'root',
    group   =>  'root',
    content =>  "Some content\n",
}

file { '/tmp/multiple-file-2':
    ensure  =>  file,
    tag     =>  'group-a',
    owner   =>  'root',
    group   =>  'root',
    content =>  "Some content\n",
}

file { '/tmp/multiple-file-3':
    ensure  =>  file,
    tag     =>  'group-b',
    owner   =>  'root',
    group   =>  'root',
    content =>  "Some content\n",
}

File <| tag == 'group-a' |> {
    group       =>  'nobody',
    loglevel    =>  'warning',
}

File <||> {
    mode    =>  '0654',
}
