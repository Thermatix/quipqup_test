module QQ_Test
  class  O_Saver
    class << self

      def set_object_values_for(object_to_set,hash)
        hash.each_with_object(object_to_set) do |(key,value),object|
          if value.is_a?(Hash)
            object.send("#{object_to_meth key}=",  set_object(key,value))
          elsif value.is_a?(Array)
            value.each do |item|
              meth = "#{object_to_meth key}"
              meth = meth[-1] != 's' ? meth + 's' : meth
              object.send(meth) <<  set_object(key,item)
            end
          else
            if((meth = convert_to_meth(key,object.class.to_s.split('::').last)))
              object.send("#{meth}=",value)
            end
          end
        end
      end

      def object_to_meth o_name
        o_name.gsub(/([a-z]+)([A-Z])/,'\1_\2').downcase
      end

      def set_object key,hash
        o_name = Converters::Redirect.fetch(key,key)
        o_name = o_name[-1] == 's' ? o_name[0...-1] : o_name
        set_object_values_for(QQ_Test.const_get(o_name).new,hash)
      end

      def convert_to_meth(key,hash_n)
        hash = Converters.const_get(hash_n)
        if((val = hash.fetch(key,false)))
          case true
          when val.is_a?(Symbol)
             val
          when val.is_a?(String)
            convert_to_meth(key,Converters::Redirection)
          end
        else
          false
        end
      end
    end
  end
end
