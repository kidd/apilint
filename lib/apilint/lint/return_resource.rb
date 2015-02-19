module Apilint
  module Lint
    class ReturnResource < Linter
      MSG = 'You should return the full resource on 200 and 201 but not on 202'


      def check(request, response)
        format = request.asked_format
        good_practices = { 200 => ->(){ contains_resource(response, format) }  ,
                           201 => ->(){ contains_resource(response, format) }  ,
                           202 => ->(){ !contains_resource(response, format)}  ,
                           nil => ->(){ true }
                         }

        if good_practices[response.code].call  #return true if it contains resource
          #everything is fine
        else
          add_offense(request.smart_path, response, :body)
        end

      end

      private

      def contains_resource(res, format)
        r =  res.parse_body(format)
        if r.class ==  Array
          r.empty? or r.any?{|x| x['id'] }
        elsif r.class == Hash
          r.empty? or r['id'] or r.any?{|x| x['id'] }
        else
          raise "just a number? bad guy"
        end
      end

    end
  end
end
