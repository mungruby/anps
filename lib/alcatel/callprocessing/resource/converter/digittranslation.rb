
module Alcatel
  module CallProcessing
    module Resource
      module DIGITTRANSLATION
      
        module Converter

          def convert_fields
            self.digitpattern = convert_char_digitpattern
            self.description = convert_char_description
            self
          end

          def convert_char_digitpattern
            digitpattern.rstrip
          end

          def convert_char_description
            description.rstrip
          end

        end
      end
    end
  end
end
 
