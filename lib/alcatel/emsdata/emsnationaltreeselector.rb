
require_relative '../resource_group'

module Alcatel
  module EmsData
    class EMSNATIONALTREESELECTOR
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('NATTREESELECTOR', fields) do
          include Resource::NATTREESELECTOR
        end
      end

      def self.fields
        %w[ NATTREESELECTOR DESCRIPTION
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
