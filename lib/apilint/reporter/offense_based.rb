module Apilint
  class OffenseBasedRep < Reporter
    attr_accessor :num_requests

    def initialize
      @offenses = []
      @num_requests = 0
    end

    attr_accessor :offenses

    def report(ofs)
      offenses.push(*ofs)
    end

    def flush
      offenses.group_by{ |o|  o.lint_name }.each do |offense_type , offenses_same_type|
        header = "#{offense_type} - #{offenses_same_type.first.msg}"
        puts "\n"
        puts "-" * header.size
        puts header
        puts "-" * header.size
        offenses_same_type.group_by{|o| o.smart_path }.each do |offense_smart_path, offenses_same_smart_path|
          puts "\n\t - #{offense_smart_path}"
          offenses_same_smart_path.each do |offense|
            puts "\t\t URI: \"#{offense.path}\": \n\t\tOffense in #{offense.attr}: \"#{offense.obj.send(offense.attr)}\""
          end
        end
      end

      puts "\n--> #{num_requests} requests inspected, #{offenses.size} offenses detected"
    end
  end
end
