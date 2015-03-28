# Foundation image for infrastructure management with ChefDK and Conjur.

FROM phusion/baseimage:0.9.16

RUN apt-get update && apt-get install -y git

# Install ChefDK
RUN cd /tmp && \
  curl -o chefdk.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb && \
  dpkg -i chefdk.deb

# Add Chef foundation cookbooks and Chef configuration
ADD . /chef
ADD build/solo.rb /chef/solo.rb

WORKDIR /chef

# Build the image by running the foundation recipe
RUN chef-solo -c /chef/solo.rb -o recipe[foundation]

# Enable SSH
RUN rm /etc/service/sshd/down

# On startup, apply Conjur Host identity configuration
ADD foundation-configure.sh /etc/my_init.d/10_foundation-configure.sh
