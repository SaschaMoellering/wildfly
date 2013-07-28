#
# Cookbook Name:: wildfly-cookbook
# Recipe:: default
# Author:: Sascha Moellering (sascha.moellering@gmail.com)
# Copyright 2013
#
# license Apache v2.0
#

jboss_home = node['jboss']['home']
jboss_user = node['jboss']['user']
tarball_name = node['jboss']['tarball']

# get files
bash "put_files" do
  code <<-EOH
  cd /tmp
  wget #{node['jboss']['url']}
  mkdir -p #{jboss_home}
  
  sudo tar xvzf #{tarball_name}.tar.gz -C #{jboss_home}
  sudo chown -R jboss:jboss #{jboss_home}
  sudo ln -s /srv/jboss/#{tarball_name} /srv/jboss/wildfly
  rm -f #{tarball_name}.tar.gz
  EOH
  not_if "test -d #{jboss_home}"
end


# template init file
template "/etc/init.d/jboss" do
  source "init_deb.erb"

  mode "0755"
  owner "root"
  group "root"
end

template "#{jboss_home}/wildfly/standalone/configuration/standalone-full-ha.xml" do
  source 'standalone-full-ha.xml.erb'
  owner jboss_user
end

template "#{jboss_home}/wildfly/standalone/configuration/standalone.conf" do
  source 'standalone.conf.erb'
  owner jboss_user
end

template "#{jboss_home}/wildfly/bin/standalone.sh" do
  source 'standalone.sh.erb'
  owner jboss_user
end

# start service
service jboss_user do
  action [ :enable, :start ]
end

