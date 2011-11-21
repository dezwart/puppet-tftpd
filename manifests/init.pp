# Parameters are extraneous for the moment, e.g. /etc/inetd.conf is not
# changed.
class tftpd( $tftpd_user = 'nobody',
    $tftp_dir = '/srv/tftp' ) {

    $package = 'tftpd'

    package { $package:
        ensure  => installed,
    }

    file { $tftp_dir:
        ensure  => directory,
        owner   => $tftpd_user,
        group   => $tftpd_user,
        mode    => '0440',
        require => Package[$package],
    }
}
