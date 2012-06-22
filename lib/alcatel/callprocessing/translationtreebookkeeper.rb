
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class TRANSLATIONTREEBOOKKEEPER
 
      include Alcatel::ResourceGroup
 
      # def self.dto
      #   @dto ||= resource('PREFIX', fields) do
      #     include Resource::PREFIX
      #   end
      # end

      def self.dto treetype
        case treetype
          when 1 then
            @dto1 ||= resource('EMSWIRELESSNORMAL', fields) do
              include Resource::EMSWIRELESSNORMAL
            end
        else
          @dto3 ||= resource('PREFIX', fields) do
            include Resource::PREFIX
          end
        end
      end

      def self.fields
        %w[ TRANSTREESELECTOR TREETYPE M1TYPE M2TYPE M3TYPE M4TYPE M5TYPE DESCRIPTION
        ].map { |field_name| field_name.downcase.to_sym }
      end

      def initialize table
        # @entries = table.map { |row| self.class.dto.new(*row) }.each(&:convert_fields)
        @entries = table.map do |row|
          self.class.dto( row[1] ).new(*row).convert_fields
        end
      end

    end
  end
end
 
