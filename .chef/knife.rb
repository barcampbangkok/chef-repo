current_dir = File.dirname(__FILE__)
user = ENV['CHEF_USER'] || ENV['USER']

log_level                :info
log_location             STDOUT
node_name                user
client_key               "#{ENV['HOME']}/.chef/#{user}.pem"
validation_client_name   "barcampbangkok-validator"
validation_key           "#{ENV['HOME']}/.chef/barcampbangkok-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/barcampbangkok"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )

cookbook_path            ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]
cookbook_copyright       "Barcamp Bangkok"
cookbook_license         "apachev2"   # Barcamp is open source, yo!
cookbook_email           "ops@barcampbangkok.org"

