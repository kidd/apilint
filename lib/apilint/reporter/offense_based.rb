module Apilint
  class OffenseBasedRep < Reporter
    def initialize
      @offenses = []
    end

    attr_accessor :offenses

    def report(ofs)
      offenses.push(*ofs)
    end

    def flush
      offenses.group_by{ |o|  o.lint_name }.each do |offense_type , offenses_same_type|
        puts "----"
        puts offense_type
        offenses_same_type.group_by{|o| o.smart_path }.each do |offense_smart_path, offenses_same_smart_path|
          puts "\t----"
          puts offense_smart_path
          offenses_same_smart_path.each do |offense|
            puts "\t\t #{offense.path}: #{offense.attr} : #{offense.obj.send(offense.attr)}"
          end
        end
      end

    end

  end
end
