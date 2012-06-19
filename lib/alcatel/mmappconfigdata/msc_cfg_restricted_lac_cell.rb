
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_RESTRICTED_LAC_CELL
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('RESTRICTEDLACCELL', fields) do
          include Resource::RESTRICTEDLACCELL
          attr_accessor :mcc_mnc
        end
      end

      def self.fields
        %w[ MCC_MNC_ID LAC CELLID_BEGIN CELLID_END RESTRICTED_LAC RESTRICTION_LIST
          DESCRIPTION RESTRICTED_ACCESS_TYPE REJECTIONCAUSE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
