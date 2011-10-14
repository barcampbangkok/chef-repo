name 'app'
description 'Role for systems to run the Barcamp Django application'

run_list(
  'recipe[build-essential]',    # For pip packages to build native extensions
  'recipe[barcampbkk]',
  'recipe[application]'
)

