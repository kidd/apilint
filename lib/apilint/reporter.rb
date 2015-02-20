require 'pry'
module Apilint
  class Reporter
    def self.create_reporter(type)
      type.new
    end

    def report(offenses)
      # TODO: puts 210 requests inspected, 12285 offenses detected
      if offenses.empty?
        puts "No offenses"
      else

        offense_based(offenses)
        offenses.each do |offense|
          puts "----"
          puts "#{offense.smart_path}: #{offense.msg}"
          puts "\t Offense in #{offense.obj.class} #{offense.attr}. #{offense.obj.send(offense.attr)}"
        end
      end
    end

    def flush(offenses)
      # nop
    end

  end
end
