
module Alcatel
  module CallProcessing
    module Resource
      module MSCROUTELIST

        module Comparator

          def candidate_key
            lambda { |other| self.routeindex == other.routeindex }
          end

        end
      end
    end
  end
end
 
