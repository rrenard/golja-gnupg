class gnupg::params {

  $package_ensure = 'present'

  case $::osfamily {
    'Debian': {
      $package_name ='gnupg'
    }
    'RedHat': {
      $package_name = 'gnupg2'
    }

    'Linux': {
      if $::operatingsystem == 'Amazon' {
        $package_name = 'gnupg2'
      }
      else {
        fail("Osfamily ${::osfamily} with operating system ${::operatingsystem} is not supported")
      }
    }
    default: {
      fail("Osfamily ${::osfamily} is not supported")
    }
  }

}