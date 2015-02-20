require 'active_support/inflector'

module Apilint
  Request = Struct.new(:host, :uri, :method, :headers) do
    def smart_path
      smart_path = uri.gsub(%r{(?<=/)([0-9]+)(?=[/.])}, ':param')
    end

    def asked_format
      uri =~ /\.(json|xml)(?:\?|$)/
      $1 || "unknown"
    end

    %w(get post put delete patch).each do |meth|
      define_method("#{meth}?") do
        method == meth.upcase
      end
    end


    # def is_index?
    #   parts = uri.split('/')
    #   last_elem = parts[-1].split('.')[0]
    #   ActiveSupport::Inflector.pluralize(last_elem) == last_elem
    # end

  end
end
