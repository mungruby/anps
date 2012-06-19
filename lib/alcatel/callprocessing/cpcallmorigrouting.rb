
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMORIGROUTING
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('ORIGROUTE', fields) do
          include Resource::ORIGROUTE
        end
      end

      def self.fields
        %w[ROUTEINDEX ORIGROUTINGMODIFIER DIGITTYPE ROUTEACTIONTYPE ROUTEACTION AMATRANSLATIONINDEX DESCRIPTION
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }
      end

    end
  end
end
 
