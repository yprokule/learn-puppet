#
# Selector
#

#$country = 'France'
#$country = 'CZ'
$country = 'Poland'

$drink = $country ? {
    'UK'                => 'gin',
    'Greece'            => 'metaxa',
    ['CZ', 'Germany']   => 'beer',
    'France'            => 'wine',
    default             => 'water',
}

notice("In ${country} U drink '${drink}'")
