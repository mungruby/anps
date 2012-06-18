
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_MCC_MNC 
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('MCCMNC', fields) do
          include Resource::MCCMNC
        end
      end

      def self.fields
        %w[ MCC MNC MCC_MNC_ID PLMNID DESCRIPTION ACCESSTYPE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
