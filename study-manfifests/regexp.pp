#
# Regular expressions in Puppet
#

$drink = 'tea'

#if ( $drink =~ /^(?i:)tea/ ) {
#    notice('WORKS')
#}
#
#if ( '192.168.122.55' =~ /[\d{1,3}\.\d{,3}\.\d{1,}\.\d+]/) {
#    notice("IP regexp")
#}

$example = "This is some string with and IP 172.16.1.254 address"

notice("Example: ${example}")

#
# Matching string's begining
#

if ( $example =~ /^This/ ) {
    notice("Regexp to match string's begining with 'This' => /^This/ ")
}

if ( $example =~ /^[A-Z]/ ) {
    notice("Regexp to match string which start with cappital letter => /^[A-Z]/ ")
}

if ( $example =~ /with/) {
    notice("Regexp to match word 'with' inside string => /with/")
}

if ( $example =~ /address$/ ) {
    notice("Regexp to match lines ending with 'address' => /address$/")
}


#
# Character classes
#

if ( $example =~ /[\d.\d.\d.\d]/ ) {
    notice("Regexp Character class '\d' => 'A digit character ([0-9])'")
}

if ( $example =~ /^[\w]/ ) {
    notice("Regexp Character class '\w' => 'A word character ([a-zA-Z0-9_])'")
}

if ( $example !~ /^[\W]/ ) {
    notice("Regexp Character class '\W' => 'A non-word character ([^a-zA-Z0-9_])'")
}

if ( $example =~ /^[\D]/ ) {
    notice("Regexp Character class '\D' => 'A non-digit character ([^0-9])'")
}

if ( ' my line with space' =~ /^[\W]/ ){
    notice("Regexp Character class '\W' => 'A non-word character ([^a-zA-Z0-9_])'")
}

