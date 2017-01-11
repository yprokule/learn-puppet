#
# Resource Type File
#

$mygroup = 'nobody'
$myowner = 'nobody'

$mydir = '/var/tmp/my_dir'

$myfiles = [
        "${mydir}/my_regular_file_1",
        "${mydir}/my_regular_file_2",
        "${mydir}/my_regular_file_3"
    ]

$source_file = "${mydir}/my_source_file.txt"

$mylink = '/var/tmp/my_link_target'


$mycontent = "#
#\tThis is content of a file.
#
HOSTNAME    ${facts['fqdn']}
domainname  example.com
dns1        dns1.example.com
dns2        dns2.example.com\n"

$update_content = "This is updated content\n"

file { $myfiles:
    ensure      =>  'file',
    content     =>  $mycontent,
    checksum    =>  'md5lite',
    group       =>  $mygroup,
    owner       =>  $myowner,
    mode        =>  '0644',
    require     =>  File[$mydir],
    show_diff   =>  'true',
    replace     =>  'true',
    backup      =>  '.puppet-backup',
    #noop        =>  'true',
}

file { $source_file:
    ensure  =>  file,
    source  =>  'puppet:///modules/myfilesource/example_one.txt',
    mode    =>  '0644',
    owner   =>  $myowner,
    group   =>  $mygroup,
}

file { 'directory':
    path        =>  $mydir,
    ensure      =>  'directory',
    group       =>  $mygroup,
    owner       =>  $myowner,
    mode        =>  '0777',
}

file { 'symlink':
    path        =>  $mylink,
    ensure      =>  'link',
    target      =>  "${myfiles[2]}",
    group       =>  'root',
    owner       =>  'root',
    mode        =>  '0644',
}
