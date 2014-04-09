require 'rspec'
require 'resolv'
require 'rspec-dns'
require 'yaml'

def update_config(conf)
  _config_file = File.join('config', 'dns.yml')
  File.open(_config_file,'w') do |file|
    file.write(conf.to_yaml)
  end
end

