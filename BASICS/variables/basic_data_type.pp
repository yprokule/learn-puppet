#
# Data type
#

$my_integer     = 123
$my_float       = 1.23
$my_bool_true   = true
$my_bool_false  = false
$my_undef       = undef
$my_array       = [ 1, 2, 'three' ]
$my_hash        = { 'key1' => 'value1', 'key2' => 'value2', 'key3' => 'value3' }

if $my_integer =~ Integer {
    notice("${my_integer} is Integer data type")
}

if $my_float =~ Integer {
    notice("${my_float} is Integer data type")
} elsif $my_float =~ Float {
    notice("${my_float} is Float data type")
}

if $my_bool_true =~ Boolean and $my_bool_false =~ Boolean {
    notice("${my_bool_true} and ${my_bool_false} are Boolean data type")
}

if $my_undef =~ Undef {
    notice('$my_undef is Undef(not defined)')
}

if $my_array =~ Array[Variant[String, Integer]] {
    notice("'${my_array}' is Array data type")
}

if $my_hash =~ Hash {
    notice("'${my_hash}' is Hash data type")
}
