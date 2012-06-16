
module Alcatel
  module EmsData
    module Resource
      module ORIGROUTEMODIFIER

        module Comparator 

          def candidate_key
            lambda { |other| self.origroutingmodifier == other.origroutingmodifier }
          end

        end
      end
    end
  end
end
 
