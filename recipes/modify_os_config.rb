#
# Cookbook Name:: oraclexe
# Recipe:: ubuntu_modify_prerequsite_config
#
# Copyright (c) 2016 DEMO Team Verint, All Rights Reserved.


if node['platform_family'].eql?('debian')
  #/sbin/chkconfig
  cookbook_file '/sbin/chkconfig' do
    source 'chkconfig'
  end

  #/etc/sysctl.d/60-oracle.conf.conf
  cookbook_file '/etc/sysctl.d/60-oracle.conf' do
    source '60-oracle.conf'
  end

  #ln -s /usr/bin/awk /bin/awk
  link '/bin/awk' do
    to '/usr/bin/awk'
  end

  #mkdir /var/lock/subsys
  directory '/var/lock/subsys' do
    mode '0755'
  end
end