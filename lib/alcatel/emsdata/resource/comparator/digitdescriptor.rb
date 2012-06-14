
module Alcatel
  module EmsData
    module Resource
      module DIGITDESCRIPTOR 
        module Comparator 

          def candidate_key
            lambda { |other| self.descriptorindex == other.descriptorindex }
          end

        end
      end
    end
  end
end
 
