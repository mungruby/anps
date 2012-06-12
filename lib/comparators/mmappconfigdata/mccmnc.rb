
module Comparators
 
  module MMAppConfigData
 
    module MCCMNC

      def candidate_key
        lambda do |other|
          self.mcc == other.mcc and
          self.mnc == other.mnc
        end 
      end

    end
  end
end
 
