#
# Cookbook Name:: local_apt
# Recipe:: repository_remove_test
#
# Copyright (C) 2014 Cyril Ledru
#
# All rights reserved - Do Not Redistribute
#
local_apt_repository 'to_remove' do
  directory '/usr/local/repo_to_remove'
end

local_apt_repository 'remove_to_remove' do
  repo_name 'to_remove'
  directory '/usr/local/repo_to_remove'
  action :remove
end
