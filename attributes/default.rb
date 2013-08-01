#
# Cookbook Name:: wildfly
# Attributes:: default
# Author:: Sascha Moellering


default['jboss']['home'] = "/srv/jboss"
default['jboss']['version'] = "8.0.0"
default['jboss']['url'] = "http://download.jboss.org/wildfly/8.0.0.Alpha3/wildfly-8.0.0.Alpha3.tar.gz" 
default['jboss']['tarball'] = "wildfly-8.0.0.Alpha3"
default['jboss']['checksum'] = "7245fb11b15b883b07eb35cfd6ff64e7"
default['jboss']['user'] = "jboss"
default['jboss']['application'] = 'jboss'
default['jboss']['config'] = 'standalone'
default['jboss']['script'] = 'standalone.sh'
default['jboss']['manage_config_file'] = true
