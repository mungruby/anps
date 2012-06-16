
module Alcatel
  module SubscriberData
    module Resource
      module SPMPCARDCALLTYPE
        module Comparator

          def candidate_key
            lambda do |other|
              self.calledpty_begin == other.calledpty_begin and
              self.calledpty_end == other.calledpty_end
            end
          end

        end
      end
    end
  end
end
 
