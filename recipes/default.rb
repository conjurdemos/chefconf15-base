include_recipe 'terminal-login::install'
include_recipe 'terminal-login::sudoers'

include_recipe 'conjur_base::chefdk'

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
