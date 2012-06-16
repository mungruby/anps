
module Alcatel
  module CallProcessing
    module Resource
      module LNPLIST

        module Converter

          def convert_fields
            self.digitpattern = convert_char_digitpattern
            self
          end

          def convert_char_digitpattern
            digitpattern.rstrip
          end

        end
      end
    end
  end
end
 
