# == Class: apache
#
# Full description of class apache here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'apache':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class apache {
	package {
		"apache2": ensure => installed;
	}

	apache::vhost { 'example.com':
		port	=> '80',
		docroot => 'var/www/html'
	}

	file { '/var/www/html/':
		source => ["puppet:///html/",],
		ensure => directory,
	  recurse => true,
	}

	file { "/etc/apache/apache.conf":
		source  => ["puppet:///modules/apache/apache.conf",],
		mode    => 444,
		owner   => root,
		group   => root,
		# package must be installed before configuration file
		require => Package["apache2"],
	}

	service { "apache":
		# automatically start at boot time
		enable     => true,
		# restart service if it is not running
		ensure     => running,
		# "service apache status" returns useful service status info
		hasstatus  => true,
		# "service apache restart" can restart service
		hasrestart => true,
		# package and configuration must be present for service
		require    => [ Package["apache"],
			        File["/etc/apache/apache.conf"] ],
		# changes to configuration cause service restart
		subscribe  => File["/etc/apache/apache.conf"],
	}
}
