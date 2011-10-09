name 'base'
description 'Base role for any systems managed by Chef'

run_list(
  'recipe[chef-client::delete_validation]',
  'recipe[chef-client]'
)

