require 'spec_helper'

describe 'tftpd' do
  packages = [ 'tftpd' ]
  tftp_dir = '/srv/tftp'
  dirs = [ tftp_dir ]

  context 'default' do
    it {
      packages.map { |x| should contain_package(x) }
    }

    it {
      dirs.map { |x| should contain_file(x).with({
          'ensure' => 'directory',
        })
      }
    }
  end
end
