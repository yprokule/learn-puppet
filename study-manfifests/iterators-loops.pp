#
# Iterators and Loops
#

$array = [ 1, 2, 'three', "${facts[os][family]}", [5, 6] ]

$array.each | $index, $value | {
    notice("Index: ${index} : Value: ${value}")
}
