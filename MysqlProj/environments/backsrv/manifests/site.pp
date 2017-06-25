node 'back-srv' {
  package { "mysql-server":
    ensure => present,
  }
  service { "mysqld": 
    ensure => running,
    enable => true,
    require => Package['mysql-server']
  }
}

cron { 
  sql_cron:
    command => "/vagrant/mysql_backup.sh ",
    user => "root",
    hour => [23],
    minute => [50],
}
