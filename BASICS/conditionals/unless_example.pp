#
# Unless conditional
#

$delivery_type = 'low'
#$delivery_type = 'medium'

unless $delivery_type != 'low' {
    $rate = 1.2
} else {
    $rate = 2.3
}

notice("Your plan '${delivery_type}' has max rate of '${rate}'")

$age = 18

$allowed = unless $rate > 2.0 {
        notice("U need rate more than 2.0")
        false
    } else {
        notice("Rate is more than 2.0")
        true
    }

if $allowed {
    notice("Unless is used as value: '${allowed}'")
} else {
    notice("Unless is used as value: '${allowed}'")
}
