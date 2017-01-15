#
# Iterators and Loops
#

$array = [ 1, 2, 'three', "${facts[os][family]}", [5, 6] ]

$array.each | $index | {
    notice("Array. Passing one element to lambda: ${index}")
}

notice("Array. Passing index/value to lambda")
$array.each | $index, $value | {
    notice("Array. Index: ${index} : Value: ${value}")
}

