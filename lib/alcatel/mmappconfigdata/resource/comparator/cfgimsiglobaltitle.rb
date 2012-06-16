
module Alcatel
  module MMAppConfigData
    module Resource
      module CFGIMSIGLOBALTITLE

        module Comparator

          def candidate_key
            lambda do |other|
              self.e212imsistr == other.e212imsistr and
              self.e214gttstr == other.e214gttstr and
              self.nwknodeid == other.nwknodeid
            end
          end

        end
      end
    end
  end
end
 
