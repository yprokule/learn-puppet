#
# Conditional Structures
#

warning(" === IF/ELSIF/ELSE Conditional === ")

$drink_1 = 'coffee'
$drink_2 = 'tea'
$drink_3 = 'energyla'

if ( $drink_1 =~ /(?i:)coffee|latte|mocha/ ) {
    notice("You like coffee beans, so do I :)")
}

if ( $drink_2 =~ /(?i:)tea/ ) {
    notice("Would U like a tea with milk?")
}

if ( $drink_3 == 'coffee' ) {
    notice("Additional coffee ?")
}
elsif ( $drink_3 == 'tea' ) {
    notice("Additional tea ?")
}
else {
    notice("I like soda as well")
}

warning(" === UNLESS Conditional === ")

$role_manager = 'manager'
$role_dev     = 'dev'

$role_tmp = "${role_manager}"

unless ( $role_tmp =~ /(?i:)dev/ ) {
    notice("UNLESS: This block is executed when condition is False")
    notice("UNLESS: manager != dev")
}

warning("=== CASE statement ===")

$food = 'cheese'

case $food {
    'olives'    :   { $country = 'Greece'; notice("Welcome to Greece")  }
    'cheese'    :   { $country = 'Switzerland'; notice("Welcome to Switzerland") }
    'baguette'  :   { $country = 'France';  notice("Welcome to France") }
    default     :   { $country = 'EU'; notice("Welcome to Europe") }
}

notice("Variable: ${country}")
