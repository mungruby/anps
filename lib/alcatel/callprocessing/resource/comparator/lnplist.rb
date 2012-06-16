
module Alcatel
  module CallProcessing
    module Resource
      module LNPLIST

        module Comparator

          def candidate_key
            lambda { |other| self.digitpattern == other.digitpattern }
          end

        end
      end
    end
  end
end
 
