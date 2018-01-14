require 'json'
require 'faker'
require 'yaml'
require 'byebug'

%w[generators singletons].each do |dir_name|
  Dir["#{File.dirname(__FILE__)}/#{dir_name}/*.rb"].each { |file| load file }
end

CONFIG = YAML.load_file('./config/config.yml') || {}

require_relative './bin/generator'

Generator.call
