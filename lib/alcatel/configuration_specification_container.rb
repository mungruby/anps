
module Alcatel
 
  module ConfigurationSpecificationContainer
 
    def self.included in_class
      in_class.extend ClassMethods
      in_class.class_eval do
        attr_accessor :mss_name
        include Enumerable
        # puts in_class.name.split(":").last
      end
    end

    module ClassMethods
      def create name, fields
        if Struct::const_defined? name
          Struct.const_get name
        else
          Struct.new name, *fields
        end
      end
    end

    def each &block
      @entries.each(&block)
    end

  end
end
 
