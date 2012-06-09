
module Comparators
 
  module CallProcessing
 
    module MSCROUTELIST

      def candidate_key
        lambda { |other| self.routeindex == other.routeindex }
      end

    end
  end
end
 
