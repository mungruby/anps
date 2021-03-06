
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMDIGITTRANSLATOR  
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('DIGITTRANSLATION', fields) do
          include Resource::DIGITTRANSLATION
        end
      end

      def self.fields
        %w[TRANSLATIONGROUP DIGITPATTERN PORTEDENABLEOFFICE ROUTEACTIONTYPE ROUTEACTION DESCRIPTION NATTREESELECTOR
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new *row }.each(&:convert_fields)
      end

    end
  end
end
 
