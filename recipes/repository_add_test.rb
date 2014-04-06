#
# Cookbook Name:: local_apt
# Recipe:: repository_add_test
#
# Copyright (C) 2014 Cyril Ledru
#
# All rights reserved - Do Not Redistribute
#
local_apt_repository 'to_add' do
  directory '/usr/local/repo_to_add'
end

local_apt_repository 'duplicate' do
  directory '/usr/local/repo_to_add'
end
