module Apilint
  module Lint
    class DowncasePath < Linter
      MSG = 'Use downcased and dash-separated path names, for alignment with
hostnames'

      def check(request, response)
        if request.uri =~ /[A-Z]/
          add_offense(request, :uri)
        end
      end
    end
  end
end
