class scriptura::management($version=undef) {

  anchor { 'scriptura::management::begin': }
  anchor { 'scriptura::management::end': }

  if ! $version {
    fail('Class[Scriptura::Management]: parameter version must be provided')
  }

  class { 'scriptura::management::package':
    version => $version
  }

  include scriptura::management::config
  include scriptura::management::service

  Anchor['scriptura::management::begin'] -> Class['Scriptura::Management::Package'] -> Class['Scriptura::Management::Config'] ~> Class['Scriptura::Management::Service'] -> Anchor['scriptura::management::end']

}