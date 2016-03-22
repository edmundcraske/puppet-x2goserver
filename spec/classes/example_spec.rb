require 'spec_helper'

describe 'x2goserver' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "x2goserver class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('x2goserver::params') }
          it { is_expected.to contain_class('x2goserver::install').that_comes_before('x2goserver::config') }
          it { is_expected.to contain_class('x2goserver::config') }
          it { is_expected.to contain_class('x2goserver::service').that_subscribes_to('x2goserver::config') }

          it { is_expected.to contain_service('x2goserver') }
          it { is_expected.to contain_package('x2goserver').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'x2goserver class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('x2goserver') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
