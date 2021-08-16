#manage apache config file
#   include apache::config
class apache::config {
  file { 'apache_config':
    ensure => $apache::config_ensure,
    path   => $apache::config_path,
    source => "puppet:///modules/apache/${osfamily}.conf",
    mode   => '0644',
    owner  => 'root',
    group  => 'root',  
  }  
  @@host {  $facts['fqdn']:
    host_aliases  => $facts['hostname'],
    ip		  => "$ipaddress",
  }
}
