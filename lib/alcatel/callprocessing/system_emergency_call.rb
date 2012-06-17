
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class SYSTEM_EMERGENCY_CALL
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('SYSTEMEMERGENCYCALL', fields) do
          include Resource::SYSTEMEMERGENCYCALL
        end
      end

      def self.fields
        %w[ DUMMY DEFAULT_PSAP_ZONE_DN DEFAULT_ESRD INVALID_ESRK DEFAULT_MPC_DN POS_INFO_TIMER
            GMLC_MPC_QUERY_TIMER PSAP_ROUTING_OPTION NON_DIAL_EMGCY_PREFIX DEFAULT_ESRK
            DEFAULT_SOLUTION_TYPE DEFAULT_LOC_DELIVERY_METHOD GMLC_DN_ESRD DEFAULT_CAMA_INFO_DIGIT
            DEFAULT_SCP_ADDRESS DEFAULT_REMOTE_SSN POS_INFO_TIMER_3G EXTENDED_POS_INFO_TIMER_3G
            TRANSLATION_OPTION CLI_FOR_SIMLESS_CALL
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
