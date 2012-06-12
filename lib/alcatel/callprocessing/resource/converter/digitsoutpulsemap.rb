
module Alcatel
  module CallProcessing
    module Resource
      module DIGITSOUTPULSEMAP

        module Converter

          def convert_fields
            self.digitpattern = convert_char_digitpattern
            self.insertdigits = convert_char_insertdigits
            self.description = convert_char_description
            self.phonecontext = convert_char_phonecontext
            self
          end

          def convert_char_digitpattern
            digitpattern.rstrip
          end

          def convert_char_insertdigits
            insertdigits.rstrip
          end

          def convert_char_description
            description.rstrip
          end

          def convert_char_phonecontext
            phonecontext.rstrip
          end

        end
      end
    end
  end
end
 
