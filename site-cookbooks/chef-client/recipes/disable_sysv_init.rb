# When using `knife bootstrap` with the default ubuntu10.04 distro templates,
# the chef-client service will be set up using a SysV init script. Since we
# switch it to upstart with chef-client cookbook config, disable the default so
# that both types of init script aren't installed.
if node[:chef_client][:init_style] == 'upstart'
  service 'chef-client' do
    provider Chef::Provider::Service::Debian
    action :disable
  end
end

