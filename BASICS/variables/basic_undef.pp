#
# Undef data type
#

if $not_defined == undef {
    notice('Variable $not_defined is not defined')
} else {
    notice("Variable ${not_defined} is '${not_defined}'")
}
