# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::install
class apache::install {
  package { "${apache::install_name}":
    ensure => present,
  }
}
