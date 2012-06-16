
module Alcatel
  module CallProcessing
    module Resource
      module HPLMODBMAP

        module Comparator

          def candidate_key
            lambda { |other| self.plmnodbid == other.plmnodbid }
          end

        end
      end
    end
  end
end
 
