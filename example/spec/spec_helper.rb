require 'rspec'
require 'resolv'
require 'rspec-dns'
require 'yaml'

def update_config(conf)
  _config_file = File.join('config', 'dns.yml')
  File.write(_config_file, conf.to_yaml)
end

