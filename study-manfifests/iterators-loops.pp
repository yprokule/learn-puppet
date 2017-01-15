#
# Iterators and Loops
#
warning("=== EACH ===")
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

warning("=== FILTER ===")

$f_array = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
notice("Initial list: ${f_array}")
$even_numbers = filter($f_array) | $element | {
    $element % 2 == 0
}

notice("All zeros: ${even_numbers}")

$f_strings = ['John', 'chandler', 'Tom', 'joey', 'Bob', 'rachel', 'Monica', 'ros', 'Fibby']
notice("The Name List: ${f_strings}")

$f_upper_names = $f_strings.filter | $element | {
    $element =~ /^[[:upper:]]/
}

notice("Names which start with uppercase: ${f_upper_names}")

$f_upper_consonant = $f_strings.filter | $element | {
    $element =~ /^[[:upper:]]/ and $element !~ /[b,c,d,f,g,k,m,n,p,q,r,s]$/
}

notice("Names which start with uppercase and don't end with consonant: ${f_upper_consonant}")

warning("=== MAP ===")

$m_array = [ 2048, 307200, 409600, 5242880, 58720256 ]

$bits      = $m_array.map | $element | { $element * 8 }
$kilobytes = $m_array.map | $element | { $element / 1024 }
$megabytes = $m_array.map | $element | { $element / 1048576 }

notice("Bytes: ${m_array}")
notice("Bits in bytes: ${bits}")
notice("KiloBytes in bytes: ${kilobytes}")
notice("MegaBytes in bytes: ${megabytes}")

warning("=== REDUCE ===")

$r_array = [ 1, 3, 5, 7, 9 ]

$r_array_size = $r_array.reduce | $memo, $value | { $memo + $value }
notice("Sum of all elements in ${r_array} is ${r_array_size}")
