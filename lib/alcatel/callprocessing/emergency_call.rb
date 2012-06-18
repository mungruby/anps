
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class EMERGENCY_CALL
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('EMERGENCYCALL', fields) do
          include Resource::EMERGENCYCALL
          attr_accessor :mcc_mnc, :network_type, :sac_begin, :sac_end
        end
      end

      def self.fields
        %w[ MCC_MNC_ID LAC CELLID_BEGIN CELLID_END ESRD SOLUTION_TYPE ESZ_ID
            CAMA_INFO_DIGITS ESRK_ASSIGNMENT_METHOD LOC_DELIVERY_METHOD ESRK_PREFIX
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new *row }.each(&:convert_fields)
      end

    end
  end
end
 
