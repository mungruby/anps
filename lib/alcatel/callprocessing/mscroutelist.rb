
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class MSCROUTELISTS
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('MSCROUTELIST', fields) do
          include Resource::MSCROUTELIST
        end
      end

      def self.fields
        %w[ ROUTEINDEX TYPE1 PARAMETER1 OUTPULSEINDEX1 TYPE2 PARAMETER2 OUTPULSEINDEX2
            TYPE3 PARAMETER3 OUTPULSEINDEX3 TYPE4 PARAMETER4 OUTPULSEINDEX4
            TYPE5 PARAMETER5 OUTPULSEINDEX5 TYPE6 PARAMETER6 OUTPULSEINDEX6
            TYPE7 PARAMETER7 OUTPULSEINDEX7 TYPE8 PARAMETER8 OUTPULSEINDEX8
            DESCRIPTION LOOKAHEAD CLIOUTPULSEINDEX1 RNOUTPULSEINDEX1 OCNOUTPULSEINDEX1
            DIGITSOUTPULSEINDEX1 DIGITSOUTPULSEINDEX2 DIGITSOUTPULSEINDEX3 DIGITSOUTPULSEINDEX4
            DIGITSOUTPULSEINDEX5 DIGITSOUTPULSEINDEX6 DIGITSOUTPULSEINDEX7 DIGITSOUTPULSEINDEX8
            PREDEFINEDCLIACTIVE1 PREDEFINEDCLIACTIVE2 PREDEFINEDCLIACTIVE3 PREDEFINEDCLIACTIVE4
            PREDEFINEDCLIACTIVE5 PREDEFINEDCLIACTIVE6 PREDEFINEDCLIACTIVE7 PREDEFINEDCLIACTIVE8
            CLIOUTPULSEINDEX2 RNOUTPULSEINDEX2 OCNOUTPULSEINDEX2 CLIOUTPULSEINDEX3 RNOUTPULSEINDEX3 OCNOUTPULSEINDEX3
            CLIOUTPULSEINDEX4 RNOUTPULSEINDEX4 OCNOUTPULSEINDEX4 CLIOUTPULSEINDEX5 RNOUTPULSEINDEX5 OCNOUTPULSEINDEX5
            CLIOUTPULSEINDEX6 RNOUTPULSEINDEX6 OCNOUTPULSEINDEX6 CLIOUTPULSEINDEX7 RNOUTPULSEINDEX7 OCNOUTPULSEINDEX7
            CLIOUTPULSEINDEX8 RNOUTPULSEINDEX8 OCNOUTPULSEINDEX8
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
