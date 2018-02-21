#
# Struct abstract data type
#

$dict_one = {
    'key1'  =>  'value1',
    'key2'  =>  'value2',
    'key3'  =>  'value3'
}

$validate_one = Struct[{
    'key1'              =>  Enum['value1', 'value2', 'value3'],
    'key2'              =>  Enum['value1', 'value2', 'value3'],
    'key3'              =>  Enum['value1', 'value2', 'value3'],
    Optional['key4']    =>  Enum['value1', 'value2', 'value3'],
}]

if $dict_one =~ $validate_one {
    notice("Hash'${dict_one}' matches '${validate_one}'")
}

$dict_two = {
    'name'  =>  'tom',
    'age'   =>  18,
    'hobby' =>  ['music', 'dansing']
}

$validate_two = Struct[
    {
        'name'  =>  String[1],
        'age'   =>  Integer[1,99],
        Optional['hobby']   =>  Variant[String,Array[String]],
        Optional['college'] =>  String[1]
    }
]

if $dict_two =~ $validate_two {
    notice("Hash'${dict_two}' matches '${validate_two}'")
} else {
    notice("Hash'${dict_two}' doesn't matches '${validate_two}'")
}
