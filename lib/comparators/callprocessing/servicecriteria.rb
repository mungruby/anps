
module Comparators
 
  module CallProcessing
 
    module SERVICECRITERIA

      def candidate_key
        lambda { |other| self.servicekey == other.servicekey }
      end

    end
  end
end
 
