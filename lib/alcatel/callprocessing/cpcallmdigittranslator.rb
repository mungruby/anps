
require_relative '../../../lib/cli/callprocessing/digittranslation'
require_relative '../../../lib/field_converter/callprocessing/digittranslation'
require_relative '../../../lib/comparators/callprocessing/digittranslation'

module Alcatel
 
  module CallProcessing
 
    class CPCALLMDIGITTRANSLATOR
 
      include Enumerable

      def self.fields
        @@fields = %w[
          TRANSLATIONGROUP
          DIGITPATTERN
          PORTEDENABLEOFFICE
          ROUTEACTIONTYPE
          ROUTEACTION
          DESCRIPTION
          NATTREESELECTOR
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def self.dto
        if Struct.const_defined? 'DIGITTRANSLATION'
          Struct.const_get 'DIGITTRANSLATION'
        else
          Struct.new "DIGITTRANSLATION", *fields do
            include ::CLI::CallProcessing::DIGITTRANSLATION
            include ::FieldConverter::CallProcessing::DIGITTRANSLATION
            include ::Comparators::CallProcessing::DIGITTRANSLATION
          end
        end
      end
       
      def self.compare_by_query_string other_obj
        Proc.new { |entry| entry.query == other_obj.query }
      end 

      def self.candidate_key other_obj
        Proc.new do |entry|
            entry.translationgroup == other_obj.translationgroup  and
            entry.nattreeselector == other_obj.nattreeselector    and
            entry.digitpattern == other_obj.digitpattern        # and
            # entry.portedenableoffice == other_obj.portedenableoffice
        end 
      end 
       
      def initialize mss_name, entries
        @mss_name, @entries = mss_name, entries
        @entries.map! { |e| self.class.dto.new(*e) }
        @entries.each(&:convert_fields)
      end

      def each &block
        @entries.each(&block)
      end

    end
  end
end
 
