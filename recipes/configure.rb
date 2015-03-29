require 'netrc'

Netrc.configure do |config|
  config[:allow_permissive_netrc_file] = true
end

template "/etc/conjur.identity" do
  source "conjur.identity.erb"
  mode 0640
  owner "root"
  group "conjur"
end.run_action(:create)

include_recipe 'terminal-login::configure'
