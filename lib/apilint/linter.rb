module Apilint
  class Linter
    attr_accessor :offenses
    @all = []

    def self.all
      @all
    end

    def self.inherited(subclass)
      @all << subclass
    end

    def initialize(config = nil)
      @config = config || Config.new
      @offenses = []
    end

    def check(request, response)
      raise "foo"
    end

    def add_offense(request, obj, attr)
      offenses << Offense.new(request.smart_path, request.uri, obj, attr, message, lint_name)
    end

    def self.lint_name
      name.to_s.split("::").last
    end

    def lint_name
      self.class.lint_name
    end

    def message
      self.class::MSG
    end

    def enabled?
      lint_config = @config.for_lint(lint_name)
      !(lint_config['Enabled'] == false)
    end
  end
end
