
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMLNPORDER
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('LNPLIST', fields) do
          include Resource::LNPLIST
        end
      end

      def self.fields
        %w[DIGITPATTERN LNPORDER].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
