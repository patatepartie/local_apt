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
  directory "create_#{new_resource.repo_name}" do
    path new_resource.directory
    owner 'root'
    group 'root'
    recursive true
    mode 00644
  end

  bash "generate_repository_#{new_resource.repo_name}" do
    user 'root'
    code 'dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz'
    cwd new_resource.directory
    not_if "test -e #{new_resource.directory}/Packages.gz"
  end

  apt_repository "add_apt_source_#{new_resource.repo_name}" do
    repo_name new_resource.repo_name
    uri "file:#{new_resource.directory}"
    components ['./']
  end
end

action :update do
  bash "regenerate_repository_#{new_resource.repo_name}" do
    user 'root'
    code 'dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz'
    cwd new_resource.directory

    notifies :run, 'execute[apt-get update]', :delayed
  end
end

action :remove do
  apt_repository "remove_apt_source_#{new_resource.repo_name}" do
    repo_name new_resource.repo_name
    action :remove
  end
end
