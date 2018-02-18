#
# Arrays
#

$array_one = [
    'This is message at index 0',
    'This is message at index 1',
    'This is message at index 2'
]

$array_two = [ 0, 1, 2, 3, 4, 5 ]

$array_three = [ 0, 'one', 2, 'three', 4, 'five', 4.4]

notice("Whole array: ${array_one}")
notice($array_one[1])
notice("Array's slice: ${array_one[1,-1]}")
$undef_index = $array_one[5]
notice("Non existing indexes produce '${undef_index}'")

if $array_one =~ Array[String, 2] {
    notice("Array has 2+ String elements")
}


if $array_two =~ Array[Integer, 0, 15] {
    notice("Array has 0..15 Integer elements")
}

if $array_three =~ Array[Variant[String, Integer], 3] {
    notice("Array has String/Integer elements ans size 3+")
}
