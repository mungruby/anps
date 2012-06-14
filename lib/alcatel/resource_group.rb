
module Alcatel
  module ResourceGroup

    # hook method
    def self.included base
      base.extend ClassMethods
      base.class_eval { include Enumerable }
    end

    module ClassMethods
      def resource name, members
        if Struct.const_defined? name
          Struct.const_get name
        else
          Struct.new name, *members
        end
      end
    end

    def each &block
      @entries.each(&block)
    end
  end
end

