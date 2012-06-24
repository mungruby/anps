
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMDIGITFENCE
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('DigitFence', fields)
      end

      def self.fields
        %w[ DIGITFENCEINDEX TRANSLATIONGROUP ONEPLUSOPTION LEADINGDIGITSCUT LEADINGDIGITSADD EXPECTEDDIGITCOUNT
            TERMINATIONTYPE SERVICEINDEX DIGITTYPE ROUTEACTIONTYPE ROUTEACTION OUTPULSE_01R_IND OUTPULSE_0ZZ_IND
            CARRIERID MAXDIGITCOUNT LEADINGDIGITSADDTYPE ECHOCANCELLATION COUNTRYCODE OUTPUTNOA TARIFFGROUP
            DESTINATIONTYPE CPC INTLPREFIXLEN NATTREESELECTOR STARTPOSITION SOURCENUMBER1 MODIFYDIGITINDEX1
            SOURCENUMBER2 MODIFYDIGITINDEX2 SOURCENUMBER3 MODIFYDIGITINDEX3 SOURCENUMBER4 MODIFYDIGITINDEX4
            SOURCENUMBER5 MODIFYDIGITINDEX5 TONEANNID TONEDURATION CALLGAPPFILTERID NOCHARGE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }
      end

      def join emsprefixfence
        digitfence = self.entries.group_by { |df| [[df.digitfenceindex],[df.expecteddigitcount]] }
        emsprefixfence.each do |epf|
          epf.df = digitfence.delete( [[epf.digitfenceindex],[epf.expecteddigitcount]] ).first
        end
        raise "Join Error" unless digitfence.empty?
        emsprefixfence
      end
    end
  end
end
 
