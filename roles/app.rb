name 'app'
description 'Base role for a system to run the Barcamp Django application'

run_list(
  'role[base-ubuntu]',
  'recipe[build-essential]',    # For pip packages to build native extensions
  'recipe[nginx]',
  'recipe[barcampbkk]',
  'recipe[application]'
)

