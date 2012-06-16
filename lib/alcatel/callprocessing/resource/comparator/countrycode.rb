
module Alcatel
  module CallProcessing
    module Resource
      module COUNTRYCODE

        module Comparator

          def candidate_key
            lambda { |other| self.countrycode == other.countrycode }
          end

        end
      end
    end
  end
end
 
