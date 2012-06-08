
module Comparators
 
  module EmsData
 
    module ORIGROUTEMODIFIER

      def candidate_key
        lambda { |other| self.origroutingmodifier == other.origroutingmodifier }
      end

    end
  end
end
 
