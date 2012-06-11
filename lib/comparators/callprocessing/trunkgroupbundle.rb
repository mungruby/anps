
module Comparators
 
  module CallProcessing
 
    module TRUNKGROUPBUNDLE

      def candidate_key
        lambda { |other| self.bundleindex == other.bundleindex }
      end

    end
  end
end
 
