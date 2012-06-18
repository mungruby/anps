
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMLRNLIST
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('LRNLIST', fields) do
          include Resource::LRNLIST
        end
      end

      def self.fields
        %w[LRN HLR_NUM].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
