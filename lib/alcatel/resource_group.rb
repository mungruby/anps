
module Alcatel
  module ResourceGroup

    # hook method
    def self.included base
      base.extend ClassMethods
      base.class_eval { include Enumerable }
    end

    module ClassMethods
      def resource name, members, &block
        if Struct.const_defined? name
          Struct.const_get name
        else
          Struct.new name, *members, &block
        end
      end
    end

    def each &block
      @entries.each(&block)
    end

    def compare other_tbl
      # false
    end
  end
end

