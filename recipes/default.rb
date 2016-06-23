#
# Cookbook Name:: oraclexe_wrapper
# Recipe:: default
#
# Copyright (c) 2016 DEMO Team Member, All Rights Reserved.

include_recipe 'oraclexe::download'
include_recipe 'oraclexe::dependencies'
include_recipe 'oraclexe::mount_run_shm'
include_recipe 'oraclexe::modify_os_config'
include_recipe 'oraclexe::register_environment'
include_recipe 'oraclexe::install'
include_recipe 'oraclexe::configure'