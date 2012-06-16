
module Alcatel
  module CallProcessing
    module Resource
      module PREFIX

        module Comparator

          def candidate_key
            lambda { |other| self.transtreeselector == other.transtreeselector }
          end

        end
      end
    end
  end
end
 
