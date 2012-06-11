
module Alcatel
  module CallProcessing
    module Resource
      module EMERGENCYZONE

        module Comparator
       
          def candidate_key
            lambda { |other| self.esz_id == other.esz_id }
          end

        end
      end
    end
  end
end
 
