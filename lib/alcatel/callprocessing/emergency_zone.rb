
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class EMERGENCY_ZONE
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('EMERGENCYZONE', fields) do
          include Resource::EMERGENCYZONE
          attr_accessor :psap_zone_dn_type
        end
      end

      def self.fields
        %w[ ESZ_ID ESZ_NAME GMLC_DN PSAP_ZONE_DN BEGIN_ESRK END_ESRK BEGIN_ESRK_POOL2 END_ESRK_POOL2
            BEGIN_ESRK_POOL3 END_ESRK_POOL3 LOC_SERVICE_OPTION EC_ROUTING_OPTION SCP_ADDRESS SCP_INAP_SSN
            INAP_E911_SERVICE_KEY ESZ_QOS_RESP_TIME_CAT
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new *row }.each(&:convert_fields)
      end

    end
  end
end
 
