module Apilint
  module Lint
    class ReturnResource < Linter
      MSG = 'You should return the full resource on 200 and 201 but not on 202'


      def check(request, response)
        format = request.asked_format
        good_practices = { 200 => ->(){ contains_resource(response.parse_body(format)) }  ,
                           201 => ->(){ contains_resource(response.parse_body(format)) }  ,
                           202 => ->(){ !contains_resource(response.parse_body(format))}  ,
                           nil => ->(){ true }
                         }

        if good_practices[response.code].call  #return true if it contains resource
          #everything is fine
        else
          add_offense(request.smart_path, response, :body)
        end

      end

      private

      def contains_resource(r)
        if r.class ==  Array
          r.empty? or r.any?{|x| x['id'] }
        elsif r.class == Hash
          require 'pry'
          binding.pry unless $go
          r.empty? or r['id'] or r.any?{|k,x| contains_resource(r[k]) }
        else
          # single value? ok
        end
      end

    end
  end
end
