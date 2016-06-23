#
# Cookbook Name:: oraclexe
# Recipe:: dependencies
#
# Copyright (c) 2016 DEMO Team Verint, All Rights Reserved.

if node['platform_family'].eql?('debian')
  # apt_update 'updating' do
  #   action  :update
  # end

  apt_package node['oracle']['linux']['dependencies'] do
    action :install
  end
end