name 'production'
description 'The production environment. Hosting contact: james@ready.co.th'

cookbook_versions(
  'application'     => '0.99.13',
  'apt'             => '1.1.2',
  'build-essential' => '1.0.0',
  'chef-client'     => '1.0.2',
  'gunicorn'        => '1.0.0',
  'postfix'         => '0.8.2',
  'postgresql'      => '0.11.1',
  'python'          => '1.0.2',
  'runit'           => '0.14.2',
  'ubuntu'          => '0.99.0'
)

