#
# Cookbook Name:: local_apt
# Recipe:: repository_add_test
#
# Copyright (C) 2014 Cyril Ledru
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

local_apt_repository 'no_locations' do
  directory '/usr/local/no_locations'
end

local_apt_repository 'one_location_one_package' do
  directory '/usr/local/one_location_one_package'
  packages_locations [node['local_apt']['spec']['dir1']]
end

local_apt_repository 'one_location_two_packages' do
  directory '/usr/local/one_location_two_packages'
  packages_locations [node['local_apt']['spec']['dir2']]
end

local_apt_repository 'two_locations_two_packages' do
  directory '/usr/local/two_locations_two_packages'
  packages_locations [node['local_apt']['spec']['dir3'], node['local_apt']['spec']['dir4']]
end
