#
# Basic numbers
#

$int_one = 15
$int_two = 13

notify { 'multiply integers':
    message => "${int_one} mulitply by ${int_two} equals ${$int_one * $int_two}"
}

$float_one = 12.5
$float_two = 5.5

notify { 'multiply float':
    message => "${float_one} multiply by ${float_two} equals ${$float_one *$float_two}"
}

$exp_one = 1e5
$exp_two = 3e5

notify { 'exponent':
    message => "Exponent is ${exp_one} and 2nd is ${exp_two}"
}

notify { 'exponent multiply':
    message => "${exp_two} * 8 equals ${$exp_two * 8}"
}

$hex_one   = 0xF    #   15
$hex_two   = 0x2A   #   42
$hex_three = 0x110  #   272

$fmt_hex = sprintf("Hex one: %X ; Decimal: %d\nHex two: %x ; Decimal two: %d",
                    $hex_one, $hex_one, $hex_two, $hex_two)

notify {'hexadecimal values':
    message => $fmt_hex,
}

$octal_one = 022    #   18
$octal_two = 037    #   31

$fmt_octal = sprintf("Octal one: %o ; Decimal: %d\nOctal two: %o ; Decimal two: %d",
                        $octal_one, $octal_one, $octal_two, $octal_two)

notify { 'octal values':
    message => $fmt_octal,
}
