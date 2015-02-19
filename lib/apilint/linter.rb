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

    def add_offense(smart_path, obj, attr)
      offenses << Offense.new(smart_path, obj, attr, message)
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
      lint_config && lint_config['Enabled']
    end
  end
end
