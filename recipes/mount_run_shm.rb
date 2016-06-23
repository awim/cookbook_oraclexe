#
# Cookbook Name:: oraclexe_wrapper
# Recipe:: mount_run_shm
#
# Copyright (c) 2016 DEMO Team Member, All Rights Reserved.

# as default /dev/shm is linked to /run/shm, so we need to detach that link so can mount /dev/shm as directory
# mkdir /dev/shm
# vim /etc/rc2.d/S01shm_load  | chmod = 755
# mount -t tmpfs shmfs -o size=2048m /dev/shm
if node['platform_family'].eql?('debian')
  link '/dev/shm' do
    action :delete
    only_if {
      ::File.symlink?('/dev/shm')
    }
  end

  directory '/dev/shm' do
    mode '0755'
    action :create
  end

  mount '/dev/shm' do
    device 'shmfs'
    fstype 'tmpfs'
    options 'size=2048m'
    action [:mount, :enable]
  end

  cookbook_file '/etc/rc2.d/S01shm_load' do
    source 'S01shm_load'
    mode '0755'
  end
end