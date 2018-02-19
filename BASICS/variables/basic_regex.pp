#
# RegEx
#

$node_www_app   = 'www-webserver-vip.mexmaple.com'
$node_www_one   = 'www.webserver1.exmaple.com'
$node_www_two   = 'www.webserver2.exmaple.com'
$node_www_three = 'www.webserver3.exmaple.com'

$node_db_app        = 'db-server-vip.mexmaple.com'
$node_db_one_mm     = 'db.server1.mm.exmaple.com'
$node_db_one        = 'db.server1.exmaple.com'
$node_db_two_mm     = 'db.server2.mm.exmaple.com'
$node_db_two        = 'db.server2.exmaple.com'
$node_db_three_mm   = 'db.server3.mm.exmaple.com'
$node_db_three      = 'db.server3.exmaple.com'

$node_list = [
    "$node_www_app",
    "$node_www_one",
    "$node_www_two",
    "$node_www_three",
    "$node_db_app",
    "$node_db_one",
    "$node_db_two",
    "$node_db_three",
    "$node_db_one_mm",
    "$node_db_two_mm",
    "$node_db_three_mm",
]

notice("List ${node_list}")
$node_list.each |$element| {
    # check vips
    if $element =~ /[[:alnum:].]*-vip\.[m]*exmaple.com$/ {
        notice("${element} is a load-balancing vip")
        notice("========================================")
    }
    if $element =~ /[[:alnum:].]\.exmaple.com$/ {
        notice("${element} is in internal network")
        notice("========================================")
    }
    if $element =~ /^db\.server[[:digit:]]{1,3}\.exmaple\.com/ {
        notice("${element} is db-server")
        notice("========================================")
    }
    if $element =~ /^db\.[[:alnum:]]{1,}[[:digit:]]{1,3}\.mm\.exmaple\.com/ {
        notice("${element} is management address of db-server")
        notice("========================================")
    }
    if $element =~ /(?i:(db|www)\.(web)*server[[:digit:]]{1,3}\.[[:alnum:].]*)/ {
        notice("Welcome to $1 server $0")
        notice("========================================")
    }
}


$regex = /(?i:(db|www)\.(web)*server[[:digit:]]{1,3}\.[[:alnum:].]*)/
if $regex =~ Regexp {
    notice("This is Regular Expression: '${regex}'")
    if $node_db_three_mm =~ $regex {
        notice("Host ${node_db_three_mm} matches regexp")
    }
}

$my_host = 'www.WEB.server.exmalpe.com'

if $my_host =~ /^(?-i:(web|db|app|www))\.([[:alnum:].]*)/ {
    notice("Case sensitive match. Match $1 ==> $2 ($0)")
    if $2 =~ /(?i:^(web|app|db|www))(\.[[:alnum:].]*)/ {
        notice("Case-insensitive match: '$1' from $0")
    }
}
