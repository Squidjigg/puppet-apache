# frozen_string_literal: true

require 'spec_helper'

describe 'apache' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_class('apache::install') }
      it { is_expected.to contain_class('apache::config') }
      it { is_expected.to contain_class('apache::service') }

      case os_facts[:osfamily]
      when 'Debian'
        it { is_expected.to contain_package('apache2').with_ensure('present') }
        it { is_expected.to contain_service('apache2').with_ensure('running') }
        it { is_expected.to contain_file('/etc/apache2/sites-available').with_ensure('directory') }
        it { is_expected.to contain_file('/etc/apache2/sites-enabled').with_ensure('directory') }
      when 'RedHat'
        it { is_expected.to contain_package('httpd').with_ensure('present') }
        it { is_expected.to contain_service('httpd').with_ensure('running') }
        it { is_expected.to contain_file('/etc/httpd/conf.d').with_ensure('directory') }
      end

      it { is_expected.to compile.with_all_deps }
    end
  end
end
