
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_IMSI_GLOBALTITLE
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('CFGIMSIGLOBALTITLE', fields) do
          include Resource::CFGIMSIGLOBALTITLE
        end
      end

      def self.fields
        %w[ E212IMSISTR E214GTTSTR NWKNODEID ACTIVEFLAG
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
