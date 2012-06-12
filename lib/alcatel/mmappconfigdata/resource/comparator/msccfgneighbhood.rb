
module Alcatel
  module MMAppConfigData
    module Resource
      module MSCCFGNEIGHBHOOD

        module Comparator
       
          def candidate_key
            lambda do |other|
              self.mcc == other.mcc and
              self.mnc == other.mnc and
              self.lac == other.lac
            end
          end

        end
      end
    end
  end
end
 
