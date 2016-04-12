require 'display_point'
require 'street'
module QQ_Test
  class CauseArea
    include DataMapper::Resource
    property :id,    Serial, :key => true
    belongs_to :disruptions
    has 1, :display_point
    has n, :streets
  end
end
