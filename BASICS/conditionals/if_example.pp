#
# IF/ELSE/ELSIF
#

$age_min = 18
$age     = 17

$allowed = ( $age =~ Integer and $age_min =~ Integer )

if allowed {
    if $age < $age_min {
        warning("Persons with age ${age} under ${age_min} ain't allowed")
    } else {
        notice("Welcome")
    }
} else {
    notice('Cannot evaluate. Either $age or $age_min isn\'t Integer')
}
