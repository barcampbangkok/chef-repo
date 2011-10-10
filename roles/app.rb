name 'app'
description 'Base role for a system to run the Barcamp Django application'

run_list(
  'role[base-ubuntu]',
  'role[postgresql-server]',
  'recipe[build-essential]',    # For pip packages to build native extensions
  'recipe[barcampbkk]'
)

