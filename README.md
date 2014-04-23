# local_apt cookbook

The goal of this cookbook is to create apt repositories local to a machine.  
They will serve all the packages contained in a particular directory and its subdirectories.

The main use case is this:  
You're developing the cookbook that manages the installation and configuration of your product, packaged as a deb file.  
In production (probably also integration, uat, staging, etc...), the cookbook installs the package from your corporate apt repository.  
But in development you don't want to have to push your package to a full blown repository to test its installation.  
With this cookbook, you just need to expose your package(s) to the VM your testing on (via synced folder for instance) and it will be available with apt-get.

See https://help.ubuntu.com/community/Repositories/Personal for details on the setup.

# Requirements
`local_apt` depends on the `apt` cookbook in its 2.0+ version, which requires Chef 11.0+.  
The code should however work on older versions. In that case override the version in your dependency manager.

# Usage
`local_apt` provides one lwrp, `local_apt_repository` and two recipes, `default` and `dependencies`.

Use the `default` recipe if you want to serve the `/usr/local/local-repository` directory (overridable).
You can either manually add the packages you want to serve in that directory or provide a list of directories containing them via an attribute.

Use the `dependencies` recipe and the `local_apt_repository` for finer control or multiple repositories.

# Attributes
* `default['local_apt']['directory']` - Directory that will be served by the `default` recipe
* `default['local_apt']['packages_locations']` - Array of directories for which all debian packages will be linked from the serving directory

# Recipes

### default recipe
In the simpliest case, just include the `default` recipe.
Add `recipe[local_apt]` at the beginning of your run list or:
```
include_recipe 'local_apt'
```

This will include and install the proper dependencies, and create a local apt repository from
```
/usr/local/local-repository
```
This is overridable by setting `node['local_apt']['directory']`.

This recipe will also link all the debian (.deb) packages found in a provided list of directories and their subdirectories from the serving directory.


### dependencies recipe
The `dependencies` recipe only install the required dependencies but do not create a local repository.
Add `recipe[local_apt::dependencies]` at the beginning of your run list or:
```
include_recipe 'local_apt::dependencies'
```

# Resources/Providers

### `local_apt_repository` lwrp
#### Actions
* :add - Adds a repository to the apt source list which serves packages from `directory` and its subdirectories
* :remove - Removes the apt source list but not `directory`

#### Attribute Parameters
* repo_name - Name of the apt source list file
* directory - Directory containing the packages to serve
* packages_locations - Directories containing packages that will be linked from `directory` and served

# License & Authors

- Author:: Cyril Ledru (<cyril.ledru@gmail.com>)

```text
Copyright (C) 2014 Cyril Ledru.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
