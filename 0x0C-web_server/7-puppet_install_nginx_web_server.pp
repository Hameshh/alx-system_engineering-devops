<<<<<<< HEAD
# Install nginx with puppet
package { 'nginx':
  ensure   => '1.18.0',
  provider => 'apt',
}

file { 'Hello World':
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Hello World',
}

file_line { 'Hello World':
  path  => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line  => '\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

exec { 'service':
  command  => 'service nginx start',
  provider => 'shell',
  user     => 'root',
  path     => '/usr/sbin/service',
}
=======

[A[# Using Puppet| Install Nginx server, setup and configuration



package { 'nginx':

  ensure => 'installed'

}



file { '/var/www/html/index.html':

  content => 'Hello World',

}



file_line { 'redirection-301':

  ensure => 'present',

  path   => '/etc/nginx/sites-available/default',

  after  => 'listen 80 default_server;',

  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',

}



service { 'nginx':

  ensure  => running,

  require => Package['nginx'],

>>>>>>> 8e35dcf03487799ca7cb411e426ddf94f7e9e1e4
