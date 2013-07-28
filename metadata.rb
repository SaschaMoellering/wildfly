maintainer       "Sascha Moellering"
maintainer_email "sascha.moellering@gmail.com"
license          "Apache v2.0"
description      "Installs/Configures Wildfly 8"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

recipe "jboss", "installs jboss from the jboss community site"

%w{ debian ubuntu }.each do |os|
  supports os
end
