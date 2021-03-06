
module Alcatel
  module SubscriberData
    module Resource
      module SPMMSISDNHLR
        module Comparator

          def candidate_key
            lambda do |other|
              self.msisdn_begin == other.msisdn_begin and
              self.msisdn_end == other.msisdn_end
            end
          end

        end
      end
    end
  end
end
 
