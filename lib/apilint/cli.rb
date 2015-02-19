require 'thor'
require 'apilint'

module Apilint
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc "check FILE", "Check FILE containing your API requests"
    option :config_file, aliases: "-c"
    def check(file)
      runner = Runner.new(config_file: options[:config_file])
      puts "Checking #{file}..."
      runner.run(file)
    end
  end
end
