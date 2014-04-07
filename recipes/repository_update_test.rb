#
# Cookbook Name:: local_apt
# Recipe:: repository_update_test
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

local_apt_repository 'to_update' do
  directory '/usr/local/repo_to_update'
end

local_apt_repository 'update_to_update' do
  repo_name 'to_update'
  directory '/usr/local/repo_to_update'
  action :update
end
