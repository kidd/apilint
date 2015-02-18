module Apilint
  Request = Struct.new(:host, :uri, :method, :headers) do
    def smart_path
      smart_path = uri.gsub(%r{(?<=/)([0-9]+)(?=[/.]}, 'param')
    end
  end
end
