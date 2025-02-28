# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::config
class apache::config {
  $apache::config_paths.each |String $config_path| {
    file { "${config_path}":
      ensure => directory,
    }
  }
}
