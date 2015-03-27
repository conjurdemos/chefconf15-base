FROM phusion/baseimage:0.9.16

RUN apt-get update && apt-get install -y git

RUN cd /tmp && \
  curl -o chefdk.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb && \
  dpkg -i chefdk.deb

ADD . /chef/foundation
ADD build/solo.rb /chef/solo.rb

WORKDIR /chef/foundation

RUN chef-solo -c /chef/solo.rb -o recipe[foundation]
