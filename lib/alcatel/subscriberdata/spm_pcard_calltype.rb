
require_relative '../../../lib/alcatel/resource_cluster'

module Alcatel
  module SubscriberData

    class SPM_PCARD_CALLTYPE

      include ResourceCluster

      def self.resource_name
        'SPMPCARDCALLTYPE'
      end

      def self.members
        %w[ CALLEDPTY_BEGIN CALLEDPTY_END PCARDNUM CALLTYPE ADMINSTATE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, entries
        @mss_name = mss_name
        data_object = self.class.resource(self.class.resource_name, self.class.members)
        @entries = entries.map do |row|
          data_object.new *row
        end
      end

    end
  end
end
 
