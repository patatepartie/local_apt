#
# Cookbook Name:: local_apt
# Library:: matchers
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

if defined?(ChefSpec)
  def add_local_apt_repository(repository_name)
    ChefSpec::Matchers::ResourceMatcher.new(:local_apt_repository, :add, repository_name)
  end

  def remove_local_apt_repository(repository_name)
    ChefSpec::Matchers::ResourceMatcher.new(:local_apt_repository, :remove, repository_name)
  end
end
