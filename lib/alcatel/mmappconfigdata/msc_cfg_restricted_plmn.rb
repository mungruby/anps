
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_RESTRICTED_PLMN
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('RESTRICTEDPLM', fields) do
          include Resource::RESTRICTEDPLMN
        end
      end

      def self.fields
        %w[ RESTRICTION_LIST MCC MNC DESCRIPTION
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
