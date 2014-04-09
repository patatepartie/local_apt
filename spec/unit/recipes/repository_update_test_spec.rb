require 'unit/spec_helper'

describe 'local_apt::repository_update_test' do
  subject(:chef_run) do
    ChefSpec::Runner.new(step_into: ['local_apt_repository']).converge(described_recipe)
  end

  before do
    stub_command('test -d /usr/local/repo_to_update').and_return(false)
    stub_command('test -e /usr/local/repo_to_update/Packages.gz').and_return(true)
  end

  it { should run_bash('regenerate_repository_to_update') }

  it 'should notify when repository is regenerated' do
    bash_update = subject.find_resource('bash', 'regenerate_repository_to_update')
    expect(bash_update).to notify('execute[apt-get update]').to(:run).delayed
  end
end