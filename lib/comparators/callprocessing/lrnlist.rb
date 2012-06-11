
module Comparators
 
  module CallProcessing
 
    module LRNLIST

      def candidate_key
        lambda { |other| self.lrn == other.lrn }
      end

    end
  end
end
 
