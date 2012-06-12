
module Alcatel 
  module CallProcessing
    module Resource
      module DIGITSOUTPULSEMAP

        module Comparator

          def candidate_key
            lambda do |other|
              self.digittype == other.digittype and
              self.inputnoa == other.inputnoa and
              self.nodeid == other.nodeid and
              self.servicekey == other.servicekey and
              self.outpulsemapindex == other.outpulsemapindex and
              self.digitpattern == other.digitpattern and
              self.mindigitcount == other.mindigitcount and
              self.maxdigitcount == other.maxdigitcount
            end
          end

        end
      end
    end
  end
end
 
