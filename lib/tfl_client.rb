require 'net/http'
require 'net/https'
require 'converters'

module QQ_Test
  class TFL_Client
    class << self
      attr_accessor :update_time, :last_update

      def mins(mins)
        mins*60
      end

      def convert(xml_string)
        XmlSimple.xml_in(xml_string, SXML_Config)
      end
    end
    self.last_update = {}
    self.update_time = DateTime.now

    SXML_Config =  {
      'KeyAttr' => {
        'id' => 'id'
      },
      'GroupTags' => {
        'Disruptions' => 'Disruption',
        'Streets' => 'Street'

      },
       'ForceArray' => false
      }



    Host = "data.tfl.gov.uk"
    Path =  "/tfl/syndication/feeds/tims_feed.xml"
    App_Info = "?app_id=%s&app_key=%s"
    Https_port = 443
    Ciphers = "ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:-LOW"
    Content_type = {'Content-Type' =>'application/xml'}

    def initialize
      @http =  Net::HTTP.new(Host, Https_port)
      @http.use_ssl = true
      @http.ssl_version = :TLSv1
      @http.ciphers = Ciphers
      @http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      path  = Path
      if ENV['tfl_app_id']
        path += App_Info % [ENV['tfl_app_id'],ENV['tfl_app_key']]
      end
      @req = Net::HTTP::Get.new(path, Content_type)
    end



    # I'd normally use a delagtor but at this moment, can't be arsed

    def update_time
      self.class.update_time
    end

    def set_update_time(value)
      self.class.update_time = value
    end

    def last_update
      self.class.last_update
    end

    def set_last_update(value)
      self.class.last_update = value
    end

    def get_tim
      if DateTime.now >=  update_time
        xml = @http.start {|make| make.request(@req) }.body
        convert(xml)['Disruptions']
      else
        false
      end
    end

    def convert(xml_string)
      res = self.class.convert(xml_string)
      set_last_update DateTime.parse(res['Header']['PublishDateTime']['canonical']) +
      mins(res['Header']['RefreshRate'].to_i)
    end


  end
end
