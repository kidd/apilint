require 'json'

module Apilint
  module Lint
    class ValidJson < Linter
      MSG = 'Critical: Json returned is not a valid json!'

      def check(request, response)
        return if request.asked_format != 'json'
        begin
          JSON.parse(response.body)
        rescue JSON::ParserError => e
          add_offense(request, response, :body)
        end
      end

    end
  end
end
