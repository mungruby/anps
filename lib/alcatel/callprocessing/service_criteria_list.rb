
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class SERVICE_CRITERIA_LIST
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('SERVCRILIST', fields) do
          include Resource::SERVCRILIST
        end
      end

      def self.fields
        %w[SERVICEKEY DIGITPATTERN DIGITTYPE].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
