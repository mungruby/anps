
module Comparators
 
  module CallProcessing
 
    module HPLMODBMAP

      def candidate_key
        lambda { |other| self.plmnodbid == other.plmnodbid }
      end

    end
  end
end
 
