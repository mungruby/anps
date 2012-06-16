
module Alcatel
  module MMAppConfigData
    module Resource
      module RESTRICTEDPLMN

        module Comparator

          def candidate_key
            lambda do |other|
              self.restriction_list == other.restriction_list and
              self.mcc == other.mcc and
              self.mnc == other.mnc
            end
          end

        end
      end
    end
  end
end
 
