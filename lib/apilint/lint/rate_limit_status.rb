module Apilint
  module Lint
    class RateLimitStatus < Linter
      MSG = 'Return the remaining number of request tokens with each request in the `RateLimit-Remaining` response header.'

      def check(request, response)
        return if response.headers.any? { |k, v| k =~ /^(X-RateLimit|RateLimit)/ }
        add_offense(request, response, :headers)
      end
    end
  end
end
