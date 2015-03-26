current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'conjurbot'
client_key               ENV['CLIENT_PEM']
chef_server_url          'https://api.opscode.com/organizations/chefconf15-conjur'
