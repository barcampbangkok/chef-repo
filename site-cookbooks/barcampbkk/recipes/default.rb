#
# Cookbook Name:: barcampbkk
# Recipe:: default
#
# Copyright 2011, Barcamp Bangkok
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nginx'
include_recipe 'barcampbkk::appuser'

appuser = node[:barcampbkk][:appuser]

# We deploy from git, so install it!
# The official Opscode git cookbook sets a dependency on runit, which isn't
# really required unless setting up a git server, so just install it ourselves.
case node[:platform]
when 'debian', 'ubuntu'
  package 'git-core'
end

#
# PostgreSQL database
#
# The 'application' cookbook is intended to integrate with the 'database'
# cookbook, which doesn't currently support Postgres, so we set things up
# ourselves.
#
# Postgres' IDENT authentication is enabled by default, so system user names
# map to Postgres users -- we just need to create the Postgres user, not worry
# about setting a password.
#
postgresql_user appuser

postgresql_database "barcampbkk_#{node.chef_environment}" do
  owner appuser
end

#
# nginx - proxies Django requests to gunicorn, and serves static assets
#
template "#{node[:nginx][:dir]}/sites-available/barcampbkk" do
  source "nginx-barcampbkk.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

nginx_site 'default' do
  enable false
end

nginx_site 'barcampbkk'

