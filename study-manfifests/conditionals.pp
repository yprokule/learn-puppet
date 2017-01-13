#
# Conditional Structures
#

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
