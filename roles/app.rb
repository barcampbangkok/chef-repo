name 'app'
description 'Base role for a system to run the Barcamp Django application'

run_list(
  'role[base-ubuntu]',
  'recipe[barcampbkk]'
)

