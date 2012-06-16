
module Alcatel 
  module CallProcessing
    module Resource
      module EMERGENCYCALL

        module Comparator

          def candidate_key
            lambda do |other|
              self.mcc_mnc == other.mcc_mnc and
              self.lac == other.lac and
              self.cellid_begin == other.cellid_begin and
              self.cellid_end == other.cellid_end and
              self.network_type == other.network_type
            end
          end

        end
      end
    end
  end
end
 
