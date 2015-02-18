module Apilint
  Offense = Struct.new(:smart_path, :obj, :attr, :msg) do
    def full_message
      "#{obj.class} (#{smart_path}): #{attr} - #{obj.send(attr)} - #{msg}"
    end
  end
end
