module Apilint
  module Lint
    class DeepPath < Linter
      MSG = 'Limit nesting depth by preferring to locate resources at the root path.'

      # TODO: Configure a prefix. Ex: :prefix => '/admin/api/'

      def check(request, _response)
        return if request.uri.split("/").size <= 3
        add_offense(request, :uri)
      end
    end
  end
end
