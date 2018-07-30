node ip-10-0-4-109 {
  cron { "puppet update":
    command => "cd /etc/puppet && git pull -q origin master",
    user    => root,
    minute  => "*/2",
  }
}

node ip-10-0-4-211 {
	include sshd
  include apache
}

node ip-10-0-4-48 {
	include sshd
  include apache
}

user { 'alegge':
  ensure           => 'present',
  home             => '/home/alegge',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '501',
}

user { 'alajaji':
  ensure           => 'present',
  home             => '/home/alajaji',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '502',
}

user { 'ashears':
  ensure           => 'present',
  home             => '/home/ashears',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '503',
}

user { 'aarcher':
  ensure           => 'present',
  home             => '/home/aarcher',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '504',
}

user { 'crestonw':
  ensure           => 'present',
  home             => '/home/crestonw',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '505',
}

user { 'alonzo':
  ensure           => 'present',
  home             => '/home/alonzo',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '506',
}

user { 'ktb11':
  ensure           => 'present',
  home             => '/home/ktb11',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '507',
}

user { 'mhagel2':
  ensure           => 'present',
  home             => '/home/mhagel2',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '508',
}

user { 'jbeder1':
  ensure           => 'present',
  home             => '/home/jbeder1',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '509',
}

user { 'dbeeman':
  ensure           => 'present',
  home             => '/home/dbeeman',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '510',
}

user { 'injoker':
  ensure           => 'present',
  home             => '/home/injoker',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '511',
}

user { 'mantail':
  ensure           => 'present',
  home             => '/home/mantail',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '512',
}

user { 'stevev':
  ensure           => 'present',
  home             => '/home/stevev',
  comment           => 'debug',
  shell            => '/bin/bash',
  uid              => '513',
}
