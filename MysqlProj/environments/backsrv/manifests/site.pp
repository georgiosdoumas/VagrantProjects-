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
    command => "echo mysql_backup.sh > /dev/pts/0",
    user => "root",
    hour => [23],
    minute => [50],
}
