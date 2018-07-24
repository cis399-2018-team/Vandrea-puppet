# == Class: sshd
#
# Full description of class sshd here.
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
#  class { 'sshd':
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
class sshd {
	package {
		"openssh-server": ensure => installed;
	}

	file { "/etc/ssh/sshd_config":
		source  => [
			"puppet:///modules/sshd/sshd_config",
		],
		mode    => 444,
		owner   => root,
		group   => root,
		# package must be installed before configuration file
		require => Package["openssh-server"],
	}

	service { "sshd":
		# automatically start at boot time
		enable     => true,
		# restart service if it is not running
		ensure     => running,
		# "service sshd status" returns useful service status info
		hasstatus  => true,
		# "service sshd restart" can restart service
		hasrestart => true,
		# package and configuration must be present for service
		require    => [ Package["openssh-server"],
			        File["/etc/ssh/sshd_config"] ],
		# changes to configuration cause service restart
		subscribe  => File["/etc/ssh/sshd_config"],
	}
}

ssh_authorized_key { "vohoanvu-key-pair-oregon":
  user => "ubuntu",
	type => "ssh-rsa",
	key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCLEzMHLXllTFyMDAsc2ad4fg9AFIPS62y43YQtx2JrF/EktaxciY1j+8H1wLA1EBDE8+1KapPiHXBFU/XenDEyYwGWwiVpuMtPv7ceHmLDW86uM64TO2rVGxGIJBb/qxLLqYoiJMKNX6hTP43ENBKeampArGYQuDRnOpF7LB9BN5qSqGDi821zrdBwHtZACksAKVx0cOU6coIsXkUmx1QGz/nqActZVKjW7MsSdSWc+rtduLz8tehqIw14psDaQAiqivElwvubhatkGP19WsBJPjelc5fWOqZvgToKEyecxXygDqOGej/bRWy+AyROlZpjjtMD7oXgi6XDD4jlDqtz",
	}

	ssh_authorized_key { "vandrea-key-pair-oregon":
	  user => "ubuntu",
		type => "ssh-rsa",
		key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCCWJ/eu8Xee7sCXkGb11LWQslGZ5m53yjtSFAuqle/obo2H/7UKGCPmJpb4r9frd6eMxkyU3tJeP1MqmAnpHZszq/STAHCRbJiUTCiIf1fSwMf43SgGrma4e4yDW0Pm8/TmOThPXvVL4XpnRaY8ISMjkV6ag3Et9VW/oZyflZtfz1kzYW3ytMJQj5MyCilCkDkfp7RHD3eCr4buK7sVEbB/a+JlWgVLxGOWt6eAnn0VXGBammbbS4NUi8ewGbeKVmdxEyb7wLdGAKXZCeu2hl6VwvM6nWNM3nStPhlu3YFwEkC7NJOcA4KqSSnlg22/PF9fndSGTI2Qe3JC1QB2rM5",
		}
