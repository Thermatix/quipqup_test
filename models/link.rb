
module QQ_Test
  class Link
    include DataMapper::Resource
    property :id,    Serial, :key => true
    property :toid, Integer

    belongs_to :street

    has 1, :vector

    alias_method :line, :vector
    alias_method :line=, :vector=

  end
end
