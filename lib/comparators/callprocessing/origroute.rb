
module Comparators
 
  module CallProcessing
 
    module ORIGROUTE

      def candidate_key
        lambda do |other|
          self.origroutingmodifier == other.origroutingmodifier and
          self.routeindex == other.routeindex
        end 
      end

    end
  end
end
 
