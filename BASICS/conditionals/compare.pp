#
#
#

$array_one = [ 1, 2, 3 ]
$array_two = [ 1, 3, 2 ]

if $array_one == $array_two {
    notice("Arrays are equal")
} else {
    notice("Arrays aint' equal")
}

$dict_one = {
    'key1'  =>  'value1',
    'key2'  =>  'value2',
    'key3'  =>  'value3',
}


$dict_two = {
    'key1'  =>  'value1',
    'key3'  =>  'value3',
    'key2'  =>  'value2',
}

if $dict_one == $dict_two {
    notice("Hashes are equal")
} else {
    notice("Hashes aint' equal")
}

$str_one = 'hello'
$str_two = 'hello world'

if $str_one == $str_two {
    notice("Strings' sizes are equal")
} elsif $str_one > $str_two {
    notice("Strings' sizes aint' equal")
    notice("\$str_one longer than \$str_two")
} elsif $str_one < $str_two {
    notice("Strings' sizes aint' equal")
    notice("\$str_one shorter than \$str_two")
}

# substring
if $str_one in $str_two {
    notice("'${str_one}' is substring of '${str_two}'")
}

if 'OMP micromp now' =~ /[[:alnum:][:space:]]*(omp)[[:alnum:][:space:]]*/ {
    notice("case sensitive search works => '${1}' from '${0}'")
} else {
    notice("case sensitive search fails")
}
