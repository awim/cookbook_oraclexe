#
# Cookbook Name:: oraclexe
# Recipe:: download
#
# Copyright (c) 2016 DEMO Team Verint, All Rights Reserved.

remote_file "/tmp/#{node['oracle']['dpkg']['name']}" do
  source node['oracle']['source']['package']
    retries 6
    mode '0755'
  action :create
end