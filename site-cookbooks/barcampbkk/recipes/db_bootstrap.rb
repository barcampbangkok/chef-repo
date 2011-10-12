#
# Author:: Seth Chisamore <schisamo@opscode.com> and
#          Ches Martin <ches@nausicaamedia.com>
# Cookbook Name:: barcampbkk
# Recipe:: db_bootstrap
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

# THIS RECIPE IS DESTRUCTIVE.
#
# It is intended for the first deployment of the app -- it runs `manage.py
# syncdb --all` and migrations, sets up the Django admin superuser and loads
# fixtures for initial app/CMS data. It should be manually added to a node's
# run list (via knife) for the first deploy, and this recipe will then remove
# itself from the run list after running. It probably should check for database
# contents and refuse to run the bootstrap commands
#
# This was adapted largely from the db_bootstrap recipe in the django_cms
# cookbook of Opscode's django-quick-start example app:
#
#    https://github.com/opscode/django-quick-start
#

app = data_bag_item('apps', 'barcampbkk')
virtualenv = resources(:python_virtualenv => app['id'])
python_bin = ::File.join(virtualenv.path, "bin", "python")
django_admin = ::File.join(virtualenv.path, "bin", "django-admin.py")

admin_username = app['admin_username'] || 'admin'
admin_password = app['admin_password'] || 'djangocms'
admin_email    = app['admin_email']    || 'webdev@barcampbangkok.org'

execute "db_bootstrap" do
  command <<-EOS
  #{django_admin} syncdb --all --noinput
  #{django_admin} createsuperuser --noinput --username=#{admin_username} --email=#{admin_email}
  #{python_bin} -c \"from django.contrib.auth.models import User; u=User.objects.get(username='#{admin_username}'); u.set_password('#{admin_password}'); u.save();\"  
  #{django_admin} migrate --fake
  #{django_admin} loaddata fixtures/dev/*
  EOS
  user app['owner']
  cwd "#{app['deploy_to']}/current"
  environment app['env']
  notifies :create, "ruby_block[remove_django_cms_bootstrap]", :immediately
end

ruby_block "remove_django_cms_bootstrap" do
  block do
    Chef::Log.info("Django CMS Database Bootstrap completed, removing the destructive recipe[barcampbkk::db_bootstrap]")
    node.run_list.remove("recipe[barcampbkk::db_bootstrap]") if node.run_list.include?("recipe[barcampbkk::db_bootstrap]")
  end
  action :nothing
end

