require 'spec_helper'

describe file('/usr/local/local-repository') do
  it { should be_directory }
end

describe file('/usr/local/local-repository/Packages.gz') do
  it { should be_file }
end

describe file('/etc/apt/sources.list.d/local.list') do
  it { should be_file }
end

describe command('apt-cache show test-dpkg') do
  it { should return_exit_status 0 }
end