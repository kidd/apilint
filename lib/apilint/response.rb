require 'json'
require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

module Apilint
  Response = Struct.new(:code, :headers, :body) do
    def parse_body(format)
      if body == "" then return {} end
      if  format == 'json'
        begin
          JSON.parse(body)
        rescue JSON::ParserError => e
        end
      elsif format == 'xml'
        begin
          return Hash.from_xml(body)
        rescue
          return nil
        end
      end
    end
  end
end
