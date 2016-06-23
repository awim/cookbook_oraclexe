#
# Cookbook Name:: oraclexe
# Recipe:: configure
#
# Copyright (c) 2016 DEMO Team Verint, All Rights Reserved.

# /etc/init.d/oracle-xe configure
linux_oracle_configure = '/etc/init.d/oracle-xe configure responseFile=/tmp/oracle_init.conf'

template 'throw oracle_init.conf' do
  source  'oracle_init.conf.erb'
  path    '/tmp/oracle_init.conf'
end

execute linux_oracle_configure do
  live_stream true
  creates '/u01/app/oracle/oradata'
  returns [0, 1]
end

service 'oracle-xe' do
  action :restart
end