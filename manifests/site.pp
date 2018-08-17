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
  	include users
	class { 'nodejs': }
        class { '::nodejs':
        nodejs_dev_package_ensure => 'present',
        npm_package_ensure        => 'present',
        repo_class                => '::epel',
        }
        class { '::tmux': }

}

node ip-10-0-4-48 {
	include sshd
  	include apache
  	include users
	class { 'nodejs': }
        class { '::nodejs':
        nodejs_dev_package_ensure => 'present',
        npm_package_ensure        => 'present',
        repo_class                => '::epel',
        }
        class { '::tmux': }

}
