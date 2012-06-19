
require_relative '../resource_group'

module Alcatel
  module MMAppConfigData
    class MSC_CFG_NETWORKNODES
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('MSCNETWORKNODE', fields) do
          include Resource::MSCNETWORKNODE
        end
      end

      def self.fields
        %w[ NODEID NODETYPE POINTCODE ADDRESS VERSION DESCRIPTION
            ROUTINGCHOICE FORMAT NOA XLATIONTYPE CAMELPHASES NETWORKID
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
