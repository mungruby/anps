
require_relative '../resource_group'

module Alcatel
  module EmsData
    class EMSDIGITDESCRIPTOR
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource("DIGITDESCRIPTOR", fields) do
          include Resource::DIGITDESCRIPTOR
        end
      end

      def self.fields
        %w[DESCRIPTOR DESCRIPTORINDEX DESCRIPTORTYPE].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
