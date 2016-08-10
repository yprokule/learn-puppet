# Resource collectors (AKA the spaceship operator)
# select a group of resources by searching the attributes
# of every resource in the catalog.

User <| groups == 'fake' |> {
    ensure  =>  absent,
}

#
# All resources of type 'USER',
# which have explicitly declared attribute 'groups'
# with a value of 'fake'
# has to be removed :)
#

File <| tags == 'telemetry' |> {
    notify  => Service['telemetry-master'],
}

#
# Set attribute 'notify' for all FILE resources
# to send notifications to 'telemetry-master' service
#
