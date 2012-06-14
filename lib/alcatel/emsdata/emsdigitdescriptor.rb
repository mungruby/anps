
require_relative '../resource_group'

module Alcatel
  module EmsData
    class EMSDIGITDESCRIPTOR
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @@dto ||= resource("DIGITDESCRIPTOR", *fields) do
          include Alcatel::EmsData::Resource::DIGITDESCRIPTOR
        end
      #   @@dto ||= Struct.new "DIGITDESCRIPTOR", *fields do
      #     include Alcatel::EmsData::Resource::DIGITDESCRIPTOR
      #   end
      end

      def self.fields
        @@fields ||= %w[
          DESCRIPTOR
          DESCRIPTORINDEX
          DESCRIPTORTYPE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      # attr_accessor :mss_name, :entries
      attr_accessor :mss_name

      def initialize mss_name, table
        # @mss_name = mss_name
        # @entries = []
        @mss_name, @entries = mss_name, table.map { |row| self.class.dto.new(row) }
        # @entries.each(&:convert_fields)
      end

    end
  end
end
 
