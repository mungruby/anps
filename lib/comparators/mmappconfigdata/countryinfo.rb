
module Comparators
 
  module MMAppConfigData
 
    module COUNTRYINFO

      def candidate_key
        lambda { |other| self.country_id == other.country_id }
      end

    end
  end
end
 
