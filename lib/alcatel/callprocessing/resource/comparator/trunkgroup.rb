
module Alcatel
  module CallProcessing
    module Resource
      module TRUNKGROUP

        module Comparator

          def candidate_key
            lambda do |other|
              self.bundleindex == other.bundleindex and
              self.sysgrporder == other.sysgrporder
            end
          end

        end
      end
    end
  end
end
 
