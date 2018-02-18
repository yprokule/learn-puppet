#
# Booleans
#

$my_true_bool  = true
$my_false_bool = false

if $my_true_bool == $my_false_bool {
    notice("Smth wrong")
} else {
    notice("${my_true_bool} neq ${my_false_bool}")
}

$empty_string = ''
if $empty_string {
    notice( "Empty strings are considered TRUE" )
}

$zero_num = 0
if $zero_num {
    notice( "Numeric 0 are considered TRUE" )
}

$my_undef = undef
if $my_undef {
    notice( "This is not printed")
} else {
    notice("'undef' is considered as FALSE")
}
