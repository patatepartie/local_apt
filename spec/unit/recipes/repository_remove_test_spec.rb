require_relative '../spec_helper'

describe 'local_apt::repository_remove_test' do
  subject(:chef_run) do
    ChefSpec::Runner.new(step_into: ['local_apt_repository']).converge(described_recipe)
  end

  before do
    stub_command('test -d /usr/local/repo_to_remove').and_return(false)
    stub_command('test -e /usr/local/repo_to_remove/Packages.gz').and_return(false)
  end

  it { should remove_apt_repository('to_remove') }
end