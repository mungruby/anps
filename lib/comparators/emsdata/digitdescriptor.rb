
module Comparators
 
  module EmsData
 
    module DIGITDESCRIPTOR 

      def candidate_key
        lambda { |other| self.descriptorindex == other.descriptorindex }
      end

    end
  end
end
 
