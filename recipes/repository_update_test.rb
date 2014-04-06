#
# Cookbook Name:: local_apt
# Recipe:: repository_update_test
#
# Copyright (C) 2014 Cyril Ledru
#
# All rights reserved - Do Not Redistribute
#
execute 'apt-get update' do
  action :nothing
end

local_apt_repository 'to_update' do
  directory '/usr/local/repo_to_update'
end

local_apt_repository 'update_to_update' do
  repo_name 'to_update'
  directory '/usr/local/repo_to_update'
  action :update
end
