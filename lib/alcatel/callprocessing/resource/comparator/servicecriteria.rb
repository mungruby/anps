
module Alcatel
  module CallProcessing
    module Resource
      module SERVICECRITERIA

        module Comparator

          def candidate_key
            lambda { |other| self.servicekey == other.servicekey }
          end

        end
      end
    end
  end
end
 
