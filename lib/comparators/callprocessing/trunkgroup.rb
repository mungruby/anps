
module Comparators
 
  module CallProcessing
 
    module TRUNKGROUP

      def candidate_key
        lambda do |other|
          self.bundleindex == other.bundleindex and
          self.sysgrporder == other.sysgrporder
        end 
      end

    end
  end
end
 
