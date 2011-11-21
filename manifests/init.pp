# Parameters are extraneous for the moment, e.g. /etc/inetd.conf is not
# changed.
class tftpd( $tftpd_user = 'nobody',
    $tftpd_group = 'nogroup',
    $tftp_dir = '/srv/tftp' ) {

    $package = 'tftpd'

    package { $package:
        ensure  => installed,
    }

    file { $tftp_dir:
        ensure  => directory,
        owner   => $tftpd_user,
        group   => $tftpd_group,
        mode    => '0550',
        require => Package[$package],
    }
}
