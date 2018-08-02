class apache1 {

package     { 'mysql':
            ensure          => installed,
            source          => 'N:/packages/mysql-5.5.16-winx64.msi',
            install_options => [ '/S', { 'INSTALLDIR' => 'C:\mysql-5.5' } ],
            }


exec    { "tar -xf /Volumes/nfs02/important.tar":
        cwd     => "/var/tmp",
        creates => "/var/tmp/myfile",
        path    => ["/usr/bin", "/usr/sbin"],
        logoutput => on_failure
            ## change on_failure to true to log everything
}



file { "/etc/sudoers":
	 mode => 440,
	 owner => root,
	 group => root,
	 source => "puppet:///modules/admin/sudoers",
	 backup => ".bak"
	 }


}