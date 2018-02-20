#
# Sensitive data type
#

$password = Sensitive.new('123admin')

notice("Password is now masked ${password}")

if $password.unwrap == '123admin' {
    notice('Password matches')
} else {
    notice('Wrong password')
}
