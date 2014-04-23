require 'spec_helper'

describe 'local_apt::test_repository_add' do
  # Cannot find a way to mock the packages finding code so use real directory structure
  let(:dir1) { File.expand_path('../../data/dir1', __FILE__) }
  let(:dir2) { File.expand_path('../../data/dir2', __FILE__) }
  let(:dir3) { File.expand_path('../../data/dir3', __FILE__) }
  let(:dir4) { File.expand_path('../../data/dir4', __FILE__) }

  subject(:chef_run) do
    ChefSpec::Runner.new(step_into: ['local_apt_repository']) do |node|
      node.set['local_apt']['spec']['dir1'] = dir1
      node.set['local_apt']['spec']['dir2'] = dir2
      node.set['local_apt']['spec']['dir3'] = dir3
      node.set['local_apt']['spec']['dir4'] = dir4
    end.converge(described_recipe)
  end

  context 'no packages locations' do
    it { should create_directory('/usr/local/no_locations') }
    it { should add_apt_repository('no_locations') }
    it { should run_bash('generate_repository_no_locations').with(cwd: '/usr/local/no_locations') }
  end

  context 'one location one package' do
    it { should create_link('pkg1-1.deb').with(target_file: '/usr/local/one_location_one_package/pkg1-1.deb', to: "#{dir1}/pkg1-1.deb") }
  end

  context 'one location two packages' do
    it { should create_link('pkg2-1.deb').with(target_file: '/usr/local/one_location_two_packages/pkg2-1.deb', to: "#{dir2}/pkg2-1.deb") }
    it { should create_link('pkg2-2.deb').with(target_file: '/usr/local/one_location_two_packages/pkg2-2.deb', to: "#{dir2}/pkg2-2.deb") }
  end

  context 'two locations two packages' do
    it { should create_link('pkg3-1.deb').with(target_file: '/usr/local/two_locations_two_packages/pkg3-1.deb', to: "#{dir3}/pkg3-1.deb") }
    it { should create_link('pkg4-1.deb').with(target_file: '/usr/local/two_locations_two_packages/pkg4-1.deb', to: "#{dir4}/pkg4-1.deb") }
  end
end
