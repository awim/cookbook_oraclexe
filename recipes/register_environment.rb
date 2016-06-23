#
# Cookbook Name:: oraclexe
# Recipe:: register_environment
#
# Copyright (c) 2016 DEMO Team Verint, All Rights Reserved.

# export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
# export ORACLE_SID=XE
# export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
# export ORACLE_BASE=/u01/app/oracle
# export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
# export PATH=$ORACLE_HOME/bin:$PATH
if node['platform_family'].eql?('debian')
  ruby_block "register oracle environment" do
    sed_insert_ORACLE_HOME_into_PATH = "sed -i '/^export PATH/{/\$ORACLE_HOME/!s,$,:$ORACLE_HOME/bin,}; /^export PATH/{$!H;$!d}; ${p;x;s///;/\\s/!d}' /home/#{node['user']}/.bashrc"
    block do
      file = Chef::Util::FileEdit.new("/home/#{node['user']}/.bashrc")
      file.insert_line_if_no_match(/^export ORACLE_HOME=/, "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe")
      file.search_file_replace_line(/^export ORACLE_HOME=/, "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe")
      file.insert_line_if_no_match(/^export ORACLE_SID=/, "export ORACLE_SID=XE")
      file.search_file_replace_line(/^export ORACLE_SID=/, "export ORACLE_SID=XE")
      file.insert_line_if_no_match(/^export NLS_LANG=/, "export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`")
      file.search_file_replace_line(/^export NLS_LANG=/, "export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`")
      file.insert_line_if_no_match(/^export ORACLE_BASE=/, "export ORACLE_BASE=/u01/app/oracle")
      file.search_file_replace_line(/^export ORACLE_BASE=/, "export ORACLE_BASE=/u01/app/oracle")
      file.insert_line_if_no_match(/^export LD_LIBRARY_PATH=/, "export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH")
      file.search_file_replace_line(/^export LD_LIBRARY_PATH=/, "export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH")
      file.insert_line_if_no_match(/^export PATH=/, "export PATH=$PATH:$ORACLE_HOME/bin")
      file.write_file

      %x{#{sed_insert_ORACLE_HOME_into_PATH}}
    end
  end
end