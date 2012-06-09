
require_relative '../../../lib/alcatel/configuration_specification_container'

module Alcatel

  module SubscriberData

    class SPM_PCARD_CALLTYPE

      include ConfigurationSpecificationContainer

      def initialize mss_name, entries
        @mss_name, @entries = mss_name, entries
        data_object = self.class.create 'SPMPCARDCALLTYPE', entries.fields
        @entries = entries.map do |row|
          data_object.new *row
        end
      end

    end
  end
end
 
