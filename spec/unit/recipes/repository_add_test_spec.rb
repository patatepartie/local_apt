require 'unit/spec_helper'

describe 'local_apt::repository_add_test' do
  subject(:chef_run) do
    ChefSpec::Runner.new(step_into: ['local_apt_repository']).converge(described_recipe)
  end

  let(:to_add_dir_present) { false }
  let(:to_add_package_present) { false }

  before do
    stub_command('test -d /usr/local/repo_to_add').and_return(to_add_dir_present)
    stub_command('test -e /usr/local/repo_to_add/Packages.gz').and_return(to_add_package_present)
  end

  context 'repository to_add' do
    it { should create_directory('/usr/local/repo_to_add') }
    it { should add_apt_repository('to_add') }
    it { should run_bash('generate_repository_to_add').with(cwd: '/usr/local/repo_to_add') }
  end

  context 'repository duplicate' do
    let(:to_add_package_present) { true }

    it { should_not run_bash('generate_repository_duplicate_directory') }
  end

  context 'already existing directory' do
    let(:to_add_dir_present) { true }

    it { should_not create_directory('/usr/local/repo_to_add') }
  end
end