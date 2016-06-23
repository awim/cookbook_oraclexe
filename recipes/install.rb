#
# Cookbook Name:: oraclexe_wrapper
# Recipe:: install
#
# Copyright (c) 2016 DEMO Team Member, All Rights Reserved.

tmp_path = '/tmp'
case node['platform_family']
  when 'debian'
    dpkg_package "/tmp/#{node['oracle']['dpkg']['name']}" do
      action :install
    end
end