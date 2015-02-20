module Apilint
  Offense = Struct.new(:smart_path, :path, :obj, :attr, :msg, :lint_name) do
  end
end
