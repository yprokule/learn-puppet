#
# Iterators and Loops
#
warning("Iterations over the list")
$array = [ 1, 2, 'three', "${facts[os][family]}", [5, 6] ]

$array.each | $index | {
    notice("Array. Passing one paramater to lambda: ${index}")
}

notice("Array. Passing index/value parameters to lambda")
$array.each | $index, $value | {
    notice("Array. Index: ${index} : Value: ${value}")
}

warning("Iteration over the dict")
$dict = {
    'first name'    =>  'John',
    'last name'     =>  'Tribianney',
    'title'         =>  'Mr',
    'occupation'    =>  'Actor',
}

$dict.each | $element | {
    notice("Dict. Iteration over: ${element}")
}

notice("Passing key/value pairs to lambda")
$dict.each | $key, $value | {
    notice("Dict. Key: '${key}'   => Value: '${value}'")
}

notice("Passing one parameter to lamda")
$dict.each | $element | {
    notice("Dict.OneParamater. Element[0]: '${element[0]}'   => Element[1]: '${element[1]}'")
}
