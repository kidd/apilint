module Apilint
  Offense = Struct.new(:obj, :attr, :msg) do
    def full_message
      "#{obj.class}: #{attr} - #{obj.send(attr)} - #{msg}"
    end
  end
end
