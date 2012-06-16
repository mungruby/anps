
module Alcatel
  module CallProcessing
    module Resource
      module LRNLIST

        module Comparator

          def candidate_key
            lambda { |other| self.lrn == other.lrn }
          end

        end
      end
    end
  end
end
 
