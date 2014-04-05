#
# Cookbook Name:: local_apt
# Provider:: repository
#
# Copyright (C) 2014 Cyril Ledru
#
# All rights reserved - Do Not Redistribute
#

use_inline_resources if defined?(use_inline_resources)

action :add do
  directory new_resource.directory

  bash "generate_repository_#{new_resource.name}" do
    user 'root'
    code 'dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz'
    cwd new_resource.directory
    not_if { ::File.exists?("#{new_resource.directory}/Packages.gz") }
  end

  apt_repository "apt_source_#{new_resource.name}" do
    repo_name new_resource.name
    uri "file:#{new_resource.directory}"
    components ['./']
  end
end

action :update do
  directory new_resource.directory

  bash "regenerate_repository_#{new_resource.name}" do
    user 'root'
    code 'dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz'
    cwd new_resource.directory

    notifies :run, 'execute[apt-get update]', :delayed
  end
end

action :remove do
  directory new_resource.directory do
    action :delete
  end

  apt_repository "apt_source_#{new_resource.name}" do
    repo_name new_resource.name
    uri "file:#{new_resource.directory}"
    components ['./']
    action :remove
  end
end
