module QQ_Test
  class App < Sinatra::Base

    configure do
      set :root,File.expand_path('../../../', __FILE__)
      set :opal_libs, %w{opal ruta reactive-ruby opal-browser}
    end

    include Asset_Pipeline

    use TFL

    helpers Helpers

    get "/" do
      erb :index
    end

    get /[^\/]/ do
      erb :index
    end
  end
end
