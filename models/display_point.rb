require 'vector'
module QQ_Test
  class DisplayPoint
    include DataMapper::Resource
    property :id,    Serial, :key => true


    belongs_to :cause_area
    has 1, :vector

    alias_method :point, :vector
    alias_method :point=, :vector=
  end
end
