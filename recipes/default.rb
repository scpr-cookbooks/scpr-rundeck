#
# Cookbook Name:: scpr-rundeck
# Recipe:: default
#
# Copyright (c) 2015 Southern California Public Radio, All Rights Reserved.

include_recipe "rundeck"
#include_recipe "rundeck::chef"

# -- Write our admin acl -- #

['admin.aclpolicy'].each do |cf|
  cookbook_file "/etc/rundeck/#{cf}" do
    source  cf
    owner   'rundeck'
    group   'rundeck'
    mode    00644
    action  :create
  end
end
# -- Install Rundeck Plugins -- #

rundeck_plugin "rundeck-slack-incoming-webhook-plugin-0.3.jar" do
  checksum  "499b9d00278b775ac56cec0f717dcebfcac7aa1b3b68fc804e311d9818d695d1"
  url       "https://github.com/higanworks/rundeck-slack-incoming-webhook-plugin/releases/download/v0.3.dev/rundeck-slack-incoming-webhook-plugin-0.3.jar"
end

# -- register a consul service -- #

consul_service_def "rundeck" do
  action    :create
  notifies  :reload, "service[consul]"
end