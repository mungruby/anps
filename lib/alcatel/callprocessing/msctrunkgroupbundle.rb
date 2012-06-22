
require_relative '../resource_group'

module Alcatel
  module CallProcessing
    class MSCTRUNKGROUPBUNDLE
 
      include Alcatel::ResourceGroup
 
      def self.dto
        @dto ||= resource('TRUNKGROUP', fields) do
          include Resource::TRUNKGROUP
        end
      end

      def self.bundle_dto
        @bundle_dto ||= resource('TRUNKGROUPBUNDLE', [:bundleindex, :bundledesc]) do
          include Resource::TRUNKGROUPBUNDLE
          attr_accessor :trunkgroups
        end
      end

      def self.fields
        %w[ BUNDLEINDEX SYSGRPORDER SYSGRPNUM WEIGHT ROUTETOSAMEMSF BUNDLEDESC
            DIGITSOUTPULSEINDEX CLDOUTPULSEINDEX CLIOUTPULSEINDEX
        ].map { |field_name| field_name.downcase.to_sym }
      end

      attr_accessor :trunk_group_bundles

      def initialize table
        @trunk_group_bundles = []
        @entries = []

        create_bundles_and_groups table

        @trunk_group_bundles.each do |bundle|
          bundle.trunkgroups.sort { |a, b| a.sysgrporder <=> b.sysgrporder }
        end
      end

      private

      def create_bundles_and_groups table
        table.each do |row|
          trunkgroupbundle = self.class.bundle_dto.new(row[0], row[5]).convert_fields
          trunkgroup = self.class.dto.new(*row)
          if idx = @trunk_group_bundles.index(trunkgroupbundle)
            @trunk_group_bundles[idx].trunkgroups << trunkgroup
          else
            trunkgroupbundle.trunkgroups = []
            trunkgroupbundle.trunkgroups << trunkgroup
            @trunk_group_bundles << trunkgroupbundle
          end
          @entries << trunkgroup
        end
      end
    end
  end
end
 
