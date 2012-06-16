
module Alcatel
  module CallProcessing
    module Resource
      module DIGITTRANSLATION

        module Comparator

          def candidate_key
            lambda do |other|
              self.translationgroup == other.translationgroup and
              self.nattreeselector == other.nattreeselector and
              self.digitpattern == other.digitpattern
            end
          end

        end
      end
    end
  end
end
 
