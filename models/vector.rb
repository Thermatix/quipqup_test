module QQ_Test
  class Vector
    include DataMapper::Resource

    property :id,    Serial, :key => true
    property :en,      String
    property :ll,      String


    belongs_to :display_point
    belongs_to :link


  end
end
