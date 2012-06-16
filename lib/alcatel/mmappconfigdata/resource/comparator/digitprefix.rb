
module Alcatel
  module MMAppConfigData
    module Resource
      module DIGITPREFIX

        module Comparator 

          def candidate_key
            lambda { |other| self.digitprefix == other.digitprefix }
          end

        end
      end
    end
  end
end
 
