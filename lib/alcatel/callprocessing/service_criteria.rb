
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class SERVICE_CRITERIA
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('SERVICECRITERIA', fields) do
          include Resource::SERVICECRITERIA
        end
      end

      def self.fields
        %w[SERVICEKEY HANDLINGCRITERIA DESCRIPTION].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
