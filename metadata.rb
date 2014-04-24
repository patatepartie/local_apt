name             'local_apt'
maintainer       'Cyril Ledru'
maintainer_email 'cyril.ledru@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures local apt repositories'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'
supports         'ubuntu'

depends 'apt'
