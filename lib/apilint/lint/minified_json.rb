require 'json'
require 'json/minify'

module Apilint
  module Lint
    class MinifiedJson < Linter
      MSG = 'Extra whitespace adds needless response size to requests'

      # WARN : Inconsistency here. JSON.minify('') => '', but
      # JSON.parse('') spits an error
      def check(request, response)
        return if request.asked_format != 'json'
        begin
          if response.body != JSON.minify(response.body)
            add_offense(request, response, :body)
          end
        rescue JSON::ParserError => e
        end
      end
    end
  end
end
