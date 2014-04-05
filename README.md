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

# Usage

# Attributes

# Recipes

# Author

Author:: Cyril Ledru (<cyril.ledru@gmail.com>)
