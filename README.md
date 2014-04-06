# local_apt cookbook

The goal of this cookbook is to create apt repositories local to a machine.  
They will serve all the packages contained in a particular directory.

The main use case is this:  
You're developing the cookbook that manages the installation and configuration of your product, packaged as a deb file.  
In production (probably also integration, uat, stating, etc...), the cookbook installs the package from your corporate apt repository.  
But in development you don't want to have to push your package to a full blown repository to test its installation.  
With this cookbook, you just need to expose your package(s) to the VM your testing on (via synced folder for instance) and it will be available with apt-get.

The technique comes from https://help.ubuntu.com/community/Repositories/Personal

# Requirements
Local_apt depends on the `apt` cookbook in its 2.0+ version, which requires Chef 11.0+.  
The code should however work on older versions.  
In that case override the version in your dependency manager.

# Usage

# Attributes

# Recipes

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
