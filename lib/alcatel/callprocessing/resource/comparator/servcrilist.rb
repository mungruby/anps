
module Alcatel
  module CallProcessing
    module Resource
      module SERVCRILIST

        module Comparator

          def candidate_key
            lambda do |other|
              self.servicekey == other.servicekey and
              self.digitpattern == other.digitpattern and
              self.digittype == other.digittype
            end
          end

        end
      end
    end
  end
end
 
