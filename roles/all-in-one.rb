name 'all-in-one'
description 'Role for a single-system app/db/web server for Barcamp Django app, on Ubuntu'

run_list(
  'role[base-ubuntu]',
  'role[postgresql-server]',
  'recipe[nginx]',
  'role[mailer]',
  'role[app]'
)

