#
# Cookbook Name:: barcampbkk
# Recipe:: appuser
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

# Creates app user if not done before `knife bootstrap`, and manages SSH
# authorized keys for the user
appuser = node[:barcampbkk][:appuser]
home_dir = "/home/#{appuser}"
ssh_keys = data_bag_item('pubkeys', 'barcampbkk')

group appuser do
  gid 1001
end

user appuser do
  uid 1001
  gid 1001
  comment 'Barcamp Bangkok'
  shell '/bin/bash'
  supports :manage_home => true
  home home_dir
end

directory "#{home_dir}/.ssh" do
  owner appuser
  group appuser
  mode '0700'
end

template "#{home_dir}/.ssh/authorized_keys" do
  source 'authorized_keys.erb'
  variables :ssh_keys => ssh_keys['keys']
  owner appuser
  group appuser
  mode '0600'
end

