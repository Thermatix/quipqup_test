%w{yui/compressor sass sprockets-helpers sinatra opal xmlsimple data_mapper}.each do |lib|
  require lib
end

paths = [
  File.expand_path('../controllers', __FILE__),
  File.expand_path('../lib', __FILE__),
  File.expand_path('../models', __FILE__),
  File.expand_path('../db', __FILE__)
]

paths.each do |path|
  $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
end
