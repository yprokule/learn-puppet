#
# Regular expressions in Puppet
#

$drink = 'tea'

if ( $drink =~ /^(?i:)tea/ ) {
    notice('WORKS')
}

if ( '192.168.122.55' =~ /[\d{1,3}\.\d{,3}\.\d{1,}\.\d+]/) {
    notice("IP regexp")
}

$example = "This is some string with and IP address : 172.16.1.254"

#
# Matching string's begining
#

if ( $example =~ /^This/ ) {
    notice("Regexp to match string's begining with 'This'")
}

if ( $example =~ /^[a-z]/ ) {
    notice("Regexp to match string which start with cappital letter")
}
