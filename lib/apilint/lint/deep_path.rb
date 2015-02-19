module Apilint
  module Lint
    class DeepPath < Linter
      MSG = 'Limit nesting depth by preferring to locate resources at the root path.'

      # TODO: Configure a prefix. Ex: :prefix => '/admin/api/'

      def check(request, _response)
        lint_config = @config.for_lint(lint_name)
        max_depth   = lint_config['MaxDepth'] || 3
        prefix      = lint_config['Prefix']

        if prefix
          uri = request.uri.gsub(/^#{prefix}/, '')
        else
          uri = request.uri
        end

        if uri.split("/").size > max_depth
          add_offense(request.smart_path, request, :uri)
        end
      end
    end
  end
end
