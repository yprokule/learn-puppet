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

$r_dict = {
    'person1' => {'name' => 'joe', 'occupation' => 'actor', 'age' => 33},
    'person2' => {'name' => 'chandler', 'occupatoin' => 'bbva', 'age' => 32 },
    'person3' => {'name' => 'ross', 'occupatoin' => 'paleontolog', 'age' => 35 },
}

notice("${r_dict}")
$r_age = $r_dict.reduce(0) | $memo, $value | {
    notice("Memo: ${memo} ; Value: ${value}")
    $memo + $value[1][age]
}


$total_xfs_size = $facts['partitions'].reduce(0) | $memo, $value | {
    debug("Memo: ${memo}    Value: ${value}")
    if $value[1]['filesystem'] =~ /(?i:xfs|ext4)/ {
        notice("Use ${value[1]['filesystem']} of ${value[0]}")
        $memo + $value[1]['size_bytes']
    }
    else {
        notice("Skip ${value[1]['filesystem']} of ${value[0]}")
        $memo + 0
    }
}

notice("Total size of XFS/EXT4 partitions is ${total_xfs_size} bytes")

warning("=== SLICE ===")

$s_array_integer = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]

$s_res = slice($s_array_integer, 2)
notice("Slice: ${s_res}")

$s_res_1 = $s_array_integer.slice(2) | $element | {
    notice("Passed element is ${element}")
}

$s_res_2 = $s_array_integer.slice(3) | $one, $two, $three | {
    notice("Passed: ${one}, ${two}, ${three}")
}

$s_hash = $r_dict.slice(2)
notice("SLICE. Hash: ${s_hash}")

$s_hash_res = $r_dict.slice(1) | $element | {
    notice("SLICE. Element: ${element}")
}

$s_hash_res_2 = $r_dict.slice(2) | $element, $value | {
    notice("SLICE. Element : ${element}")
    notice("SLICE. Value   : ${value}")
}

warning("=== WITH ===")

$w_res_int = with( 7, 5, 3 ) | $one, $two, $three | {
    $one + $two + $three
}

notice("WITH: ${w_res_int}")

if defined('$one') {
    notice("VARIABLE 'one' is defined: ${one}")
}
else {
    notice("VARIABLE 'one' defined in lambda's local scope. \$one == 'undef'")
}

warning("=== MISC ===")

$misc_array_int = [ 'banana', 'apple', 'orange' ]

$misc_res = with( $misc_array_int ) | $element | {
    $total = $element.reduce(' ') | $memo, $value | {
        notice("Memo: '${memo}'  : Value: ${value}")
        "$memo $value"
    }
    #$element.each | $new | { notice("Misc. Each: ${new}") }
    #$total = $element.slice(1) | $new | {
    #    notice("Misc. Slice: ${new[0]}")
    #}
}

notice("Misc. Total: ${misc_res}")
