
module Alcatel
  module MMAppConfigData
    module Resource
      module COUNTRYINFO
 
        module Comparator

          def candidate_key
            lambda { |other| self.country_id == other.country_id }
          end

        end
      end
    end
  end
end
 
