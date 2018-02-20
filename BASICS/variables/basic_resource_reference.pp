#
# Resource reference
#

$file_one = '/tmp/file_one.txt'
$file_two = '/tmp/file_two.txt'

$default_owner = 'nobody'
$default_group = 'nobody'
$default_mode  = '0755'

$content_one = @("FCTN"/)
    This is a file called ${file_one}.
        File's owner is '${default_owner}'
        File's group is '${default_group}'
        File's mode  is '${default_mode}'
    |FCTN

$content_two = @("FCTN2"/)
    This is a file called $file_two
      It uses resource references to access attributes\
     from resource called File[$file_one].
      Any change of those attributes will be reflected\
     in resource File[$file_two].
    |FCTN2

file { $file_one:
    mode    =>  $default_mode,
    owner   =>  $default_owner,
    group   =>  $default_group,
    content =>  $content_one,
}

file { $file_two:
    mode    =>  $default_mode,
    owner   =>  File[$file_one]['owner'],
    group   =>  File[$file_one]['group'],
    content =>  $content_two,
}
