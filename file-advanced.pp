file { '/tmp/crap.txt':
    ensure  =>  file,
    content =>  "/*\n/* Managed by Puppet\n/*",
    mode    =>  '0644',
    ownwer  =>  'root',
    group   =>  'root',
}

file {
    default:
        ensure  =>  file,
        mode    =>  '0644',
        ownwer  =>  'root',
        group   =>  'root',
    ;

    '/tmp/another1.txt':
        ensure  =>  file,
        content =>  "Another-1 File all default\n",
    ;

    '/tmp/another2.txt':
        ensure  =>  file,
        content =>  "Another-2 File\nOverriden mode: 0654",
        mode    =>  '0654',
    ;

    '/tmp/another3.txt':
        ensure  =>  file,
        content =>  "Another-3 File\nOverride User: ",
        ownwer  =>  'gdm',
    ;

}
