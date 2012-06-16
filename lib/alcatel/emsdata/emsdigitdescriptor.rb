
require_relative '../resource_group'

module Alcatel
  module EmsData
    class EMSDIGITDESCRIPTOR
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource("DIGITDESCRIPTOR", fields) do
          include Resource::DIGITDESCRIPTOR
        end
      end

      def self.fields
        %w[ DESCRIPTOR DESCRIPTORINDEX DESCRIPTORTYPE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :mss_name

      def initialize mss_name, table
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new *row }
      end

    end
  end
end
 
