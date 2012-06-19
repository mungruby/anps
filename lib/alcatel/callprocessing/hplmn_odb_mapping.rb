
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class HPLMN_ODB_MAPPING
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('HPLMODBMAP', fields) do
          include Resource::HPLMODBMAP
        end
      end

      def self.fields
        %w[PLMNODBID SERVICEKEY].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }
      end

    end
  end
end
 
