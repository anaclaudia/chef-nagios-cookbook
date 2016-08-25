require 'server_helper'

describe file('/usr/local/nagios/bin/nagios') do
  it { should be_executable }
end

describe file('/usr/local/nagios/libexec/check_nrpe') do
  it { should be_executable }
end

describe file('/usr/local/nagios/libexec') do
  it { should be_directory }
  it { should be_owned_by 'nagios' }
  it { should be_grouped_into 'nagios' }
end

describe package('apache2') do
  it { should be_installed }
end

describe service('nagios') do
  it { should be_running }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end
