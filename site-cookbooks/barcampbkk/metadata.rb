maintainer       "Barcamp Bangkok"
maintainer_email "ops@barcampbangkok.org"
license          "Apache 2.0"
description      "Installs/Configures barcampbkk"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

recipe           'barcampbkk', 'Sets up environment the Barcamp Django-CMS application'
recipe           'appuser', 'Ensures app user exists and authorizes SSH pubkeys'
recipe           'db_bootstrap', 'First-time deployment database content initialization'

attribute 'barcampbkk/appuser',
  :display_name => 'Barcamp BKK app user',
  :recipes => %w[ barcampbkk ],
  :default => 'barcamp',
  :description => 'User name that the Barcamp BKK app will run under'

