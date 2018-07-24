node ip-10-0-4-109 {
  cron { "puppet update":
    command => "cd /etc/puppet && git pull -q origin master",
    user    => root,
    minute  => "*/2",
  }
}

node ip-10-0-4-211 {
	include sshd
	class { 'apache': }
	apache::vhost { 'example.com':
		port	=> '80',
		docroot => 'var/www/html'
	}
}

node ip-10-0-4-48 {
	include sshd
	class { 'apache': }
	apache::vhost { 'example.com':
		port 	=> '80',
		docroot => 'var/www/html'
	}
}

