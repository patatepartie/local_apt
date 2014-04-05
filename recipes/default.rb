#
# Cookbook Name:: local_apt
# Recipe:: default
#
# Copyright (C) 2014 Cyril Ledru
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'local_apt::dependencies'

local_apt_repository 'local' do
  directory node['local_apt']['directory']
end
