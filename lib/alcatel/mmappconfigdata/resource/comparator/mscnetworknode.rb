
module Alcatel
  module MMAppConfigData
    module Resource
      module MSCNETWORKNODE

        module Comparator
       
          def candidate_key
            lambda { |other| self.nodeid == other.nodeid }
          end

        end
      end
    end
  end
end
 
