require_relative '../spec_helper'

describe 'local_apt::default' do
  DEFAULT_DIRECTORY = '/usr/local/local-repository'

  let(:explicit_directory) {}

  subject(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['local_apt']['directory'] = explicit_directory if explicit_directory
    end.converge(described_recipe)
  end

  it { should include_recipe('local_apt::dependencies') }
  it { should add_local_apt_repository('local').with(directory: DEFAULT_DIRECTORY) }

  context 'in an explicit directory' do
    let(:explicit_directory) { '/explicit/directory' }

    it { should add_local_apt_repository('local').with(directory: explicit_directory) }
  end
end