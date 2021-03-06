
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_COUNTRY_INFO
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('COUNTRYINFO', fields) do
          include Resource::COUNTRYINFO
        end
      end

      def self.fields
        %w[ COUNTRY_ID COUNTRY_NAME CB_CRITERIA
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
