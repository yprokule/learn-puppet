#
# Case example
#

$tariff = 'youth12'

case $tariff {
    'school'    : {
        notice('School tarrif')
    }
    'college'   : {
        notice('College tarrif')
    }
    'university': {
        notice('University tarrif')
    }
    'family'    : {
        notice('Family tarrif')
    }
    'business-1', 'business-2', 'business-3': {
        notice('Business-N tarrif')
    }
    'aio'       : {
        notice('AIO tarrif')
    }
    /youth\d{2,}$|baby\d{1}$/     : {
        notice('Youth tarrif')
    }
    default     : { notice('Default Tarrif') }
}
