#
# Iterators and Loops
#
warning("Iterations over the list")
$array = [ 1, 2, 'three', "${facts[os][family]}", [5, 6] ]

$array.each | $index | {
    notice("Array. Passing one element to lambda: ${index}")
}

notice("Array. Passing index/value to lambda")
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

$dict.each | $key, $value | {
    notice("Dict. Key: '${key}'   => Value: '${value}'")
}
