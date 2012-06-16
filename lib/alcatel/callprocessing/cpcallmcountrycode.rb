
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMCOUNTRYCODE
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('COUNTRYCODE', fields) do
          include Resource::COUNTRYCODE
        end
      end

      def self.fields
        %w[ COUNTRYCODE MINLENGTH MAXLENGTH ROUTEINDEX DESCRIPTION
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
