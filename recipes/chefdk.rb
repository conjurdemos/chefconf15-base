remote_file '/tmp/chefdk.deb' do
  source 'https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb'
  checksum 'e135c0719fc80fc7b95560e90839103167308a45d4927cf8da9c22bdc385cc7d'
end

dpkg_package 'chefdk' do
  source '/tmp/chefdk.deb'
  action :install
end