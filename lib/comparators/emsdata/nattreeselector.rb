
module Comparators
 
  module EmsData
 
    module NATTREESELECTOR

      def candidate_key
        lambda { |other| self.nattreeselector == other.nattreeselector }
      end

    end
  end
end
 
