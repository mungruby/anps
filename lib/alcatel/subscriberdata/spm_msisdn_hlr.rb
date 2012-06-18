
require_relative '../resource_group'

module Alcatel
  module SubscriberData

    class SPM_MSISDN_HLR

      include ResourceGroup

      def self.dto
        @dto ||= resource('SPMMSISDNHLR', fields) do
          include Resource::SPMMSISDNHLR
        end
      end

      def self.fields
        %w[ MSISDN_BEGIN MSISDN_END HLR_NUM PORTABLE HLR_TYPE ALT_HLR_NUM
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
