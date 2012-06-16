
module Alcatel
  module CallProcessing
    module Resource
      module LRNLIST

        module Converter

          def convert_fields
            self.lrn = convert_char_lrn
            self
          end

          def convert_char_lrn
            lrn.rstrip
          end

        end
      end
    end
  end
end
 
