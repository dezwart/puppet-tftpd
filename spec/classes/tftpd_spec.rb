require 'spec_helper'

describe 'tftpd' do
  tftpd = 'tftpd'
  inetd = 'openbsd-inetd'
  xinetd = 'xinetd'

  tftp_dir = '/srv/tftp'

  packages = [
    tftpd,
    inetd
  ]

  dirs = [
    tftp_dir
  ]

  purge_packages = [
    xinetd
  ]

  context 'default' do
    it {
      packages.map { |x| should contain_package(x) }
    }

    it {
      purge_packages.map {
        |x| should contain_package(x).with({
          'ensure' => 'purged',
        })
      }
    }

    it {
      dirs.map { |x| should contain_file(x).with({
          'ensure' => 'directory',
        })
      }
    }
  end
end
