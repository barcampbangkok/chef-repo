name 'base-ubuntu'
description 'Base role for any Ubuntu systems managed by Chef'

override_attributes(
  :chef_client => {
    :init_style => 'upstart'
  }
)

run_list(
  'recipe[apt]',
  'recipe[ubuntu]',
  'recipe[chef-client::disable_sysv_init]',
  'role[base]'
)

