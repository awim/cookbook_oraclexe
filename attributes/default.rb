default['user'] = 'vagrant'
default['oracle']['dpkg']['name'] = 'oracle-xe_11.2.0-2_amd64.deb'
default['oracle']['source']['package'] = "http://10.180.202.129:8181/KE-SourceTools/#{default['oracle']['dpkg']['name']}"
default['oracle']['linux']['dependencies'] = ['bc', 'libaio1', 'unixodbc']

default['oracle']['http-port'] = 9090
default['oracle']['tnslsnr-port'] = 1521
default['oracle']['sys-password'] = 'kelso2012'
default['oracle']['start-lsnr-on-boot'] = true