#
# Enum
#

$state_lower = 'absent'
$state_upper = 'ABSENT'

$allowed_states_lower = Enum[ 'absent', 'present' ]
$allowed_states_upper = Enum[ 'ABSENT', 'PRESENT' ]


if $state_lower =~ $allowed_states_upper {
    notice("'${state_lower}' is valid value for ${allowed_states_upper}")
} else {
    notice("'${state_lower}' is invalid value for ${allowed_states_upper}")
}

if $state_lower == 'ABSENT' {
    notice("'${state_lower}' == 'ABSENT' => is case insensitive")
}
