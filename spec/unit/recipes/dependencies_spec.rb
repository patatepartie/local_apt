require_relative '../spec_helper'

describe 'local_apt::dependencies' do
  subject(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it { should include_recipe('apt::default') }
  it { should install_package('dpkg-dev') }
end