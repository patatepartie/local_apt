#
# Cookbook Name:: local_apt
# Provider:: repository
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

use_inline_resources if defined?(use_inline_resources)

action :add do
  directory new_resource.directory do
    owner 'root'
    group 'root'
    recursive true
    mode 00755
  end

  new_resource.packages_locations.each do |location|
    # puts "location #{location}"
    packages = LocalApt.find_packages_in(location)
    # puts "packages #{packages.inspect}"
    packages.each do |filename, filepath|
      link filename do
        target_file "#{new_resource.directory}/#{filename}"
        owner 'root'
        group 'root'
        mode 00644
        to filepath
      end
    end
  end

  bash "generate_repository_#{new_resource.repo_name}" do
    user 'root'
    code 'dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz'
    cwd new_resource.directory
  end

  apt_repository new_resource.repo_name do
    repo_name new_resource.repo_name
    uri "file:#{new_resource.directory}"
    components ['./']
  end
end

action :remove do
  # TODO remove Packages.gz in directory

  apt_repository new_resource.repo_name do
    repo_name new_resource.repo_name
    action :remove
  end
end
