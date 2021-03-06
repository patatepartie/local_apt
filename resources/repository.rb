#
# Cookbook Name:: local_apt
# Resource:: repository
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

actions :add, :update, :remove

# Needed for Chef versions < 0.10.10 (copied from apt cookbook)
def initialize(*args)
  super
  @action = :add
end

attribute :repo_name, kind_of: String, name_attribute: true
attribute :directory, kind_of: String
attribute :packages_locations, kind_of: Array, default: []
