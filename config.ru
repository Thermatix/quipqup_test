ENV['enviroment'] = 'dev'



require_relative 'paths'

require 'disruptions'
require 'db'


require 'asset_pipeline'
require 'helpers'
require 'tfl_client'
require 'object_saver'
require 'converters'

require 'tfl'
require 'app'


root = File.dirname(File.expand_path('..', __FILE__))
Opal.append_path "#{root}/opal"

run QQ_Test::App
