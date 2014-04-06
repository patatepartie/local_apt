require_relative '../spec_helper'

describe 'local_apt::repository_remove_test' do
  subject(:chef_run) do
    ChefSpec::Runner.new(step_into: ['local_apt_repository']).converge(described_recipe)
  end

  before do
    stub_command('test -e /usr/local/repo_to_remove/Packages.gz').and_return(false)
  end

  it { should remove_apt_repository('remove_apt_source_to_remove') }
end