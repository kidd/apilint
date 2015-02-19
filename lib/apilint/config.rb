require 'delegate'
require 'yaml'

module Apilint
  class Config < DelegateClass(Hash)
    def initialize(hash = {})
      @hash = hash
      super(@hash)
    end

    def for_lint(lint_name)
      self[lint_name]
    end

    def self.load_from_file(path)
      hash = YAML.load_file(path)
      Config.new(hash)
    end
  end
end
