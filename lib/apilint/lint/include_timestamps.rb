module Apilint
  module Lint
    class IncludeTimestamps < Linter
      include Helpers::Resource

      MSG = "Provide `created_at` and `updated_at` timestamps for resources by default"

      def check(request, response)
        body = response.parse_body(request.asked_format)
        return if body.nil? || body.empty?

        valid = contains_attributes(body, ['created_at', 'updated_at'])
        add_offense(request.smart_path, response, :body) unless valid
      end
    end
  end
end
