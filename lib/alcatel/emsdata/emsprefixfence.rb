
require_relative '../resource_group'

module Alcatel
  module EmsData
    class EMSPREFIXFENCE
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('PREFIXFENCE', fields) do
          include Resource::PREFIXFENCE
          attr_accessor :df, :ccd
        end
      end

      def self.fields
        %w[ PREFIXTREESELECTOR DIGITPATTERN TRANSLATIONGROUP EXPECTEDDIGITCOUNT
            DIGITFENCEINDEX DESCRIPTION SELECTOR_TYPE
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
      end

    end
  end
end
 
