
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_NEIGHBORHOOD
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('MSCCFGNEIGHBHOOD', fields) do
          include Resource::MSCCFGNEIGHBHOOD
        end
      end

      def self.fields
        %w[ MCC MNC LAC MSCID VLRID DESCRIPTION ADMINSTATE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
