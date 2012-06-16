
module Alcatel
  module CallProcessing
    module Resource
      module TRUNKGROUPBUNDLE

        module Comparator

          def candidate_key
            lambda { |other| self.bundleindex == other.bundleindex }
          end

        end
      end
    end
  end
end
 
