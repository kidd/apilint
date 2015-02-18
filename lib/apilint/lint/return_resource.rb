module Apilint
  module Lint
    class ReturnResource < Linter
      MSG = 'You should return the full resource on 200 and 201 but not on 202'


      def check(request, _response)
        format = request.asked_format
        rules =  { 200 => ->(){ contains_resource(_response, format) }  ,
                   201 => ->(){ contains_resource(_response, format) }  ,
                   202 => ->(){ !contains_resource(_response, format)}  ,
                   nil => ->(){ true }
                 }

        unless rules[_response.code].call  #return true if it contains resource
          add_offense(_response, :body)
        end

      end

      private

      def contains_resource(res)
        res.parse_body['id'] or res.any?{|x| x['id'] }
      end

    end
  end
end
