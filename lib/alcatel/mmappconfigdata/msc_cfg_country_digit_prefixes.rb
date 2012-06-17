
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_COUNTRY_DIGIT_PREFIXES
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('DIGITPREFIX', fields) do
          include Resource::DIGITPREFIX
        end
      end

      def self.fields
        %w[ DIGITPREFIX COUNTRY_ID DESCRIPTION
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
