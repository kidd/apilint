module Apilint
  module Helpers
    module Resource
      def contains_attributes(resource, attrs)
        attrs.all? { |attr| contains_attribute(resource, attr) }
      end

      def contains_attribute(resource, attr)
        if resource.class == Array
          resource.empty? or resource.any?{|x| contains_attribute(x, attr) }
        elsif resource.class == Hash
          resource.empty? or resource[attr] or resource.any?{|k,v| contains_attribute(v, attr) }
        else
          # single value? ok
        end
      end
    end
  end
end
