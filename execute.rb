require 'json'
require 'faker'
require 'yaml'
require 'byebug'

def require_array(array)
  array.each do |dir_name|
    Dir["#{File.dirname(__FILE__)}/#{dir_name}/*.rb"].each { |file| load file }
  end
end

require_array(%w[helpers])

load './generators/base_generator.rb'
load './templates/base_template.rb'

require_array(%w[templates generators singletons])

CONFIG = YAML.load_file('./config/config.yml') || {}

require_relative './bin/generator'

Generator.call
