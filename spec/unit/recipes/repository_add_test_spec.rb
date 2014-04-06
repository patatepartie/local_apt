require_relative '../spec_helper'

describe 'local_apt::repository_add_test' do
  subject(:chef_run) do
    ChefSpec::Runner.new(step_into: ['local_apt_repository']).converge(described_recipe)
  end

  context 'repository to_add' do
    before do
      stub_command('test -e /usr/local/repo_to_add/Packages.gz').and_return(false)
    end

    it { should create_directory('/usr/local/repo_to_add') }
    it { should add_apt_repository('to_add') }
    it { should run_bash('generate_repository_to_add').with(cwd: '/usr/local/repo_to_add') }
  end

  context 'repository duplicate' do
    before do
      stub_command('test -e /usr/local/repo_to_add/Packages.gz').and_return(true)
    end

    it { should_not run_bash('generate_repository_duplicate_directory') }
  end
end