#
# Usage of hiera lookups
#

$rh_packages = hiera('packages','NothingToInstall')

notice("Packages to be installed: ${rh_packages}")
