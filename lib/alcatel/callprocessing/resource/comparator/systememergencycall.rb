
module Alcatel 
  module CallProcessing
    module Resource
      module SYSTEMEMERGENCYCALL

        module Comparator

          def candidate_key
            lambda { |other| self.dummy == other.dummy }
          end

        end
      end
    end
  end
end
 
