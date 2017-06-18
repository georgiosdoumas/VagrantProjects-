node 'mysql-srv' {
  package { "mysql-server":
    ensure => installed,
  }
  service { "mysqld": 
    ensure => true,
    enable => true,
    require => Package['mysql-server']
  }
  exec { "dbpopulate":
    command => '/vagrant/populatedb.sh',
    require => [ Package['mysql-server'] ],
    creates => "/vagrant/dbcreated.lock",
    timeout => 0
  }
}
