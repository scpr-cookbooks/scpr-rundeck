default.scpr_rundeck.url = "http://ops-rundeck.i.scprdev.org:4440"

default.scpr_rundeck.databag = "rundeck"

#----------

include_attribute "rundeck"

default.rundeck.url = node.scpr_rundeck.url

default.rundeck.admin.encrypted_data_bag  = false
default.rundeck.admin.data_bag            = "rundeck"
default.rundeck.admin.data_bag_id         = "credentials"

default.rundeck.deb_version   = "2.4.1-1-GA"
default.rundeck.deb_url       = "http://dl.bintray.com/rundeck/rundeck-deb/rundeck-#{node['rundeck']['deb_version']}.deb"
default.rundeck.deb_checksum  = "469a46ee0ef8d7d70f2e536703cae8a87c3206a54e97685f83be2b028dc97fe3"

default['rundeck']['stub_config_files'] = %w{ log4j.properties jaas-loginmodule.conf apitoken.aclpolicy }

#----------

include_attribute "rundeck::ssh"

default.rundeck.ssh.timeout = 0
