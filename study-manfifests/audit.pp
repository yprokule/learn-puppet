#
# Metaparameter. Audit.
#
# Marks a subset of this resource’s unmanaged attributes for auditing.
# Accepts an attribute name, an array of attribute names, or all.
#


file {'/tmp/my_audit.txt':
    audit       =>  ['group', 'owner', 'mtime', 'ctime'],
    noop        =>  false,
    loglevel    =>  'warning',
    content     =>  "Defined here\n",
    owner       =>  'nobody',
}
