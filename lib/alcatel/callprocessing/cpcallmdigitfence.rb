
# require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class CPCALLMDIGITFENCE
 
      # include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('DigitFence', fields) do
          # include Resource::COUNTRYCODE
        end
      end

      def self.fields
        %w[
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }
      end

    end
  end
end
 
