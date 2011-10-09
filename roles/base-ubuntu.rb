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
  'role[base]'
)

