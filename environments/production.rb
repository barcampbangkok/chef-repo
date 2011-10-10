name 'production'
description 'The production environment. Hosting contact: james@ready.co.th'

cookbook_versions(
  'apt'             => '1.1.2',
  'build-essential' => '1.0.0',
  'chef-client'     => '1.0.2',
  'postgresql'      => '0.11.1',
  'ubuntu'          => '0.99.0'
)

