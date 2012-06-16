
module Alcatel
  module MMAppConfigData
    module Resource
      module MCCMNC
 
        module Comparator

          def candidate_key
            lambda do |other|
              self.mcc == other.mcc and
              self.mnc == other.mnc
            end
          end

        end
      end
    end
  end
end
 
