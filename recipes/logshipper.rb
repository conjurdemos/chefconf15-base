cookbook_file '/etc/syslog-ng/conf.d/logshipper.conf' do
  source 'logshipper.conf'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/service/logshipper/run' do
  source 'logshipper.sh'
  owner 'root'
  group 'root'
  mode '0755'
end
