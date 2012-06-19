
require_relative '../resource_group'

module Alcatel
  module EmsData
    class EMSORIGROUTEPROFILELIST
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('ORIGROUTEMODIFIER', fields) do
          include Resource::ORIGROUTEMODIFIER
        end
      end

      def self.fields
        %w[ORIGROUTINGMODIFIER DESCRIPTION].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
