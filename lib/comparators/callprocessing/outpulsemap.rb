
module Comparators
 
  module CallProcessing
 
    module OUTPULSEMAP

      def candidate_key
        lambda do |other|
          self.outpulsemapid == other.outpulsemapid and
          self.digitpattern == other.digitpattern and
          self.inputnoa == other.inputnoa and
          self.mindigitcount == other.mindigitcount and
          self.maxdigitcount == other.maxdigitcount
        end 
      end

    end
  end
end
 
