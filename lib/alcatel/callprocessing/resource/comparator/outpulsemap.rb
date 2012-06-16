
module Alcatel
  module CallProcessing
    module Resource
      module OUTPULSEMAP

        module Comparator

          def candidate_key
            lambda do |other|
              self.outpulsemapid == other.outpulsemapid and
              self.digitpattern == other.digitpattern and
              self.inputnoa == other.inputnoa and
              self.mindigitcount == other.mindigitcount and
              self.maxdigitcount == other.maxdigitcount
            end
          end

        end
      end
    end
  end
end
 
