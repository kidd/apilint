module Apilint
  Request = Struct.new(:host, :uri, :method, :headers) do
    def smart_path
      smart_path = uri.gsub(%r{(?<=/)([0-9]+)(?=[/.])}, 'param')
    end

    def asked_format
      uri =~ /\.(json|xml)(?:\?|$)/
      $1 || "unknown"
    end
  end
end
