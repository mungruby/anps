
module Alcatel
  module CallProcessing
    module Resource
      module COUNTRYCODE

        module Converter

          def convert_fields
            self.countrycode = convert_char_countrycode
            self.description = convert_char_description
            self
          end

          def convert_char_countrycode
            countrycode.rstrip
          end

          def convert_char_description
            description.rstrip
          end

        end
      end
    end
  end
end
 
