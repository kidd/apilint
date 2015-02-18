require 'apilint/offense'

module Apilint
  class Linter
    attr_accessor :offenses

    def initialize
      @offenses = []
    end

    def check(request, response)
      raise "foo"
    end

    def add_offense(obj, attr)
      offenses << Offense.new(obj, attr, message)
    end

    def message
      self.class::MSG
    end
  end
end
