include_recipe 'apt'
include_recipe 'terminal-login::install'
include_recipe 'terminal-login::sudoers'

include_recipe 'foundation::logshipper'
include_recipe 'foundation::chefdk'
include_recipe 'conjur-client'

chef_gem 'netrc'

cookbook_file '/etc/conjur.conf' do
  source 'conjur.conf'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/conjur-demo.pem' do
  source 'conjur-demo.pem'
  owner 'root'
  group 'root'
  mode '0644'
  sensitive true
end
