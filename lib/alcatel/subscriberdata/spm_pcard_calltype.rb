
require_relative '../../../lib/alcatel/resource_group'

module Alcatel
  module SubscriberData

    class SPM_PCARD_CALLTYPE

      include ResourceGroup

      def self.dto
        @dto ||= resource('SPMPCARDCALLTYPE', fields) do
          include Resource::SPMPCARDCALLTYPE
        end
      end

      def self.fields
        %w[ CALLEDPTY_BEGIN CALLEDPTY_END PCARDNUM CALLTYPE ADMINSTATE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
