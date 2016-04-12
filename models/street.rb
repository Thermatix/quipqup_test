require 'link'
module QQ_Test
  class Street
    include DataMapper::Resource
    property :id,    Serial, :key => true
    property :name,      String
    property :closure,      String
    property :directions,      String


    belongs_to :cause_area
    has n, :links

  end
end
