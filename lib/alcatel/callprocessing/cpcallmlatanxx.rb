
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMLATANXX
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('NPANXX', fields) do
          include Resource::NPANXX
        end
      end

      def self.fields
        %w[LATANUMBER NPA_NXX DESCRIPTION].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
