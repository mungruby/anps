
module Comparators
 
  module CallProcessing
 
    module COUNTRYCODE

      def candidate_key
        lambda { |other| self.countrycode == other.countrycode }
      end

    end
  end
end
 
