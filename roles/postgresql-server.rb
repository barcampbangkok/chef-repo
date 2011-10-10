name 'postgresql-server'
description 'Configures systems as PostgreSQL database servers'

# The postgresql server recipe includes the client as well.
run_list(
  'recipe[postgresql::server]'
)

