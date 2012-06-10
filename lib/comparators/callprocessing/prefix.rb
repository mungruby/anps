
module Comparators
 
  module CallProcessing
 
    module PREFIX

      def candidate_key
        lambda { |other| self.transtreeselector == other.transtreeselector }
      end

    end
  end
end
 
