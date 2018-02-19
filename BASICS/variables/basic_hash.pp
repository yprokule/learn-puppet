#
# Hash data type
#

$dict_one = {
    'key1' => 'value1',
    'key2' => {
        'nkey1' => 'nvalue1',
        'nkey2' => 'nvalue2',
        'nkey3' => 'nvalue3',
    },
    'key3' => 'value3',
}

if $dict_one =~ Hash[String, Variant[String, Array, Hash]]{
    notice("Hash data type: ${dict_one}")
}

$dict_one.each  |$key, $value| {
    if $value =~ Hash {
        notice('=== Nested Hash Processing Start ===')
        $value.each |$nkey, $nvalue| {
            notice("Processing: Key: '${nkey}' ; Value: '${nvalue}'")
        }
        notice('=== Nested Hash Processing End ===')
    } elsif $value =~ String {
        notice("Processing: Key: '${key}' ; Value: '${value}'")
    } else {
        notice("DefaultProcessing: Key: '${key}' ; Value: '${value}'")
    }
}

notice("Accessing value by key['key2'] => ${dict_one['key2']}")
