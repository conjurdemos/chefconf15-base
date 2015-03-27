require 'yaml'

## install package
apt_repository 'conjur' do
  uri 'http://apt.conjur.s3-website-us-east-1.amazonaws.com'
  components %w(main)
  distribution node['lsb']['codename']
  key "apt.key"
end

package 'logshipper'

## create the group, user, fifo and logfile
group 'conjur' do
  action :create
  append true
end

user "logshipper" do
  system true
  shell '/bin/false'
  group "conjur"
end

fifo_path = '/var/run/logshipper'
if node.etc.group.include? 'syslog'
  fifo_group = 'syslog'
else
  fifo_group = 'root'
end

bash "mkfifo #{fifo_path}" do
  not_if { begin
    s = File.stat(fifo_path)
    [
      s.pipe?,
      (s.mode & 0777 == 0460),
      s.uid == node.etc.passwd.logshipper.uid,
      s.gid == node.etc.group[fifo_group].gid,
    ].all?
  rescue Errno::ENOENT, NoMethodError
    false
  end }

  code """
    rm -f #{fifo_path}
    mkfifo --mode=0460 #{fifo_path}
    chown logshipper:#{fifo_group} #{fifo_path}
  """
end

file "/var/log/logshipper.log" do
  owner 'logshipper'
  mode '0640'
end

directory '/etc/service/logshipper' do
  recursive true
end

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
