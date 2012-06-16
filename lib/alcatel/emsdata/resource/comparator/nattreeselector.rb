
module Alcatel
  module EmsData
    module Resource
      module NATTREESELECTOR
      
        module Comparator 

          def candidate_key
            lambda { |other| self.nattreeselector == other.nattreeselector }
          end

        end
      end
    end
  end
end
 
