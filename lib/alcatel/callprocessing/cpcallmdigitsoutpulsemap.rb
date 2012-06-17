
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMDIGITSOUTPULSEMAP
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('DIGITSOUTPULSEMAP', fields) do
          include Resource::DIGITSOUTPULSEMAP
        end
      end

      def self.fields
        %w[ DIGITTYPE INPUTNOA NODEID SERVICEKEY OUTPULSEMAPINDEX DIGITPATTERN MINDIGITCOUNT
            MAXDIGITCOUNT SEND STARTPOSITION DIGITSTODELETE INSERTDIGITS NORMALIZELOC
            SOURCENUMBER1 MODIFYDIGITINDEX1 SOURCENUMBER2 MODIFYDIGITINDEX2
            SOURCENUMBER3 MODIFYDIGITINDEX3 SOURCENUMBER4 MODIFYDIGITINDEX4
            SOURCENUMBER5 MODIFYDIGITINDEX5 OUTPUTNOA DESCRIPTION PRESENTATIONIND
            NUMBERINCOMPLETEIND SCREENINGIND CAPTUREINCDR PHONECONTEXT
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
