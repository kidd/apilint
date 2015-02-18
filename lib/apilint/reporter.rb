module Apilint
  class Reporter
    def report(offenses)
      if offenses.empty?
        puts "No offenses"
      else
        offenses.each do |offense|
          puts "* #{offense.full_message}"
        end
      end
    end
  end
end
