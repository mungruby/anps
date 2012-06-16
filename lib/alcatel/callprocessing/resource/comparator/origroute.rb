
module Alcatel
  module CallProcessing
    module Resource
      module ORIGROUTE

        module Comparator

          def candidate_key
            lambda do |other|
              self.origroutingmodifier == other.origroutingmodifier and
              self.routeindex == other.routeindex
            end
          end

        end
      end
    end
  end
end
 
