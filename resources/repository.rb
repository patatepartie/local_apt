#
# Cookbook Name:: local_apt
# Resource:: repository
#
# Copyright (C) 2014 Cyril Ledru
#
# All rights reserved - Do Not Redistribute
#

actions :add, :update, :remove

# Needed for Chef versions < 0.10.10 (copied from apt cookbook)
def initialize(*args)
  super
  @action = :add
end

attribute :name, :kind_of => String, :name_attribute => true
attribute :directory, :kind_of => String
