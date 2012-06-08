
module Comparators
 
  module CallProcessing
 
    module NPANXX

      def candidate_key
        lambda do |other|
          self.latanumber == other.latanumber and
          self.npa_nxx == other.npa_nxx
        end
      end

    end
  end
end
 
