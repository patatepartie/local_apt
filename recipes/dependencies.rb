#
# Cookbook Name:: local_apt
# Recipe:: dependencies
#
# Copyright (C) 2014 Cyril Ledru
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'

package 'dpkg-dev'
