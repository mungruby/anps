
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CAMEL_N_CSI_DP_CRITERIA_DATA
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('CamelCriteriaData', fields)
      end

      def self.fields
        %w[ DIGITFENCEINDEX DEFAULTHANDLING SERVICEKEY PROTOCOLTYPE DIGITSTYPE
            NETWORKLISTSINDEX NODEID SCFBUNDLEID SSN
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }
      end

      def join emsprefixfence
        camel_criteria_data = self.entries.group_by { |ccd| ccd.digitfenceindex }
        emsprefixfence.each { |epf| epf.ccd = camel_criteria_data.delete epf.digitfenceindex }
        raise "Join Error" unless camel_criteria_data.empty?
        emsprefixfence
      end
    end
  end
end
 
