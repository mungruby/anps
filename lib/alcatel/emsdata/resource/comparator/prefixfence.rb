
module Alcatel
  module EmsData
    module Resource
      module PREFIXFENCE

        module Comparator 

          def candidate_key
            lambda do |other|
              self.prefixtreeselector == other.prefixtreeselector and
              self.digitpattern == other.digitpattern and
              self.translationgroup == other.translationgroup and
              self.expecteddigitcount == other.expecteddigitcount
            end
          end

        end
      end
    end
  end
end
 
