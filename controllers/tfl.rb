module QQ_Test
  class TFL < Sinatra::Base


    get '/api/feeds/trafic/live' do
      client = QQ_Test::TFL_Client.new
      stream = client.get_tim
      if stream
        stream.each do |disruption|
          @d = Disruptions.new
          @d.disruption_id = disruption.delete'id'
          O_Saver.set_object_values_for(@d,disruption)
          if @d.save

          else

          end
        end
      else
        Disruptions.sort
      end
    end





  end
end
