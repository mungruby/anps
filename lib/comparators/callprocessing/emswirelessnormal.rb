
module Comparators
 
  module CallProcessing
 
    module EMSWIRELESSNORMAL

      def candidate_key
        lambda { |other| self.transtreeselector == other.transtreeselector }
      end

    end
  end
end
 
