require_relative 'paths'


task :load_all do
  require 'disruptions'
  require 'db'


  require 'asset_pipeline'
  require 'helpers'
  require 'tfl_client'
  require 'object_saver'
  require 'converters'

  require 'tfl'
  require 'app'
end

namespace :db do


  task :load do
    require 'disruptions'
    require 'db'
  end


  task :finalize do
    DataMapper.finalize
  end

  task :migrate do
      DataMapper.auto_migrate!
  end

  task :upgrade do
    DataMapper.auto_upgrade!
  end


  task create: [:load, :finalize,:migrate,:auto_upgrade]

  task update: [:load, :finalize, :upgrade]
end

namespace :tfl do
  task :load do
    require 'tfl_client'
  end



  task :get_stream do
    test = QQ_Test::TFL_Client.new
    stream = test.get_tim
    puts stream.first.to_s
  end

  task :test_converter do
    disruption = QQ_Test::TFL_Client.convert('tims_feed.xml')['Disruptions'].first
    @d = QQ_Test::Disruptions.new
    @d.disruption_id = disruption.delete'id'
    QQ_Test::O_Saver.set_object_values_for(@d,disruption)
    puts @d.cause_area.inspect
  end

  task test: [:load, :get_stream]

  task test_save:  [:load_all,:test_converter]
end
