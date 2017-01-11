#
# Some math operators
#

notice("================ Math operators start ================")
notice("Processor count ${::processorcount}")

$my_multipy = $::processorcount * 8
notice("Processor count multiplied by 8 => ${my_multipy}")

$my_add = $::processorcount + 8
notice("Processor count with added 8 => ${my_add}")

$my_substract = $::processorcount - 1
notice("Processor count minus 1 => ${my_substract}")

$my_division = $::processorcount / 2
notice("Processor count divided by 2 => ${my_division}")

$my_left_shift = $::processorcount << 2
notice("Processor count left-shifted by 2 => ${my_left_shift}")

$my_right_shift = $my_multipy >> 2
notice("Processor count multiplied by 8 right-shifted by 2 => ${my_right_shift}")
notice("================ Math operators end  ================")

#
# Lists might be added
#

notice("================ Array operations start ================")

$my_array_one = [ 1, 2, 'hello' ]
$my_array_two = [ 'world', 3 ]
$my_array_addition = $my_array_one + $my_array_two

notice("Array  one : ${my_array_one}")
notice("Array  two : ${my_array_two}")
notice("Array with added array ${my_array_addition}")

notice("================ Array operations end ================")

#
# Hash difference
#

notice("================ Hash operations start ================")

$user_joe = {
    name    =>  'joe',
    age     =>  '33',
    actor   =>  true,
}

$user_chandler = {
    name    =>  'chandler',
    age     =>  '34',
    occupation  =>  'data analysis',
    student     =>  false,
}

$hash_diff_chandler = $user_chandler - $user_joe
$hash_diff_joe      = $user_joe - $user_chandler

notice("Hash chandler : ${user_chandler}")
notice("Hash joe      : ${user_joe}")
notice("Hash DIFF chandler - joe : ${hash_diff_chandler}")
notice("Hash DIFF joe - chandler : ${hash_diff_joe}")

notice("================ Hash operations end ================")

#
# Number comparison
#

notice("================ Number comparison ================")
if $my_multipy >= 12 {
    notice("Quite powerfull ${my_multipy} cores processor")
}

if 0.9 < $my_substract {
    notice("Not enough entropy :(")
}

if ( $::processorcount < $my_multipy ) and ( $::processorcount > $my_substract ) {
    notice("Not bad to have ${::processorcount} cores")
}

#
# Arrays comparison
#

notice("================ Array comparison ================")

if ( [ 1, 2 ] == [ 2, 1 ] ) {
    notice("Equal arrays")
}
elsif ([1, 2] in [ 3, 1, 2, 4] ) {
    notice("Insdie another array")
}
else {
    notice("Some crappy mismatch for arrays")
}

#
# Strings comparison
#

notice("================ String comparison ================")
$my_joe = 'Joey'

if 'joe' in $my_joe {
    notice("joe in ${my_joe}    : case insensetive")
}

if 'Joe' in $my_joe {
    notice("Joe in ${my_joe}    : case insensetive")
}

if 'joe' == $my_joe {
    notice("joe == ${my_joe}")
}
else {
    notice("joe != ${my_joe}")
}

if 'joey' == $my_joe {
    notice("joey == ${my_joe} : case insensetive")
}
