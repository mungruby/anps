
module Alcatel
  module EmsData
    module Resource
      module NATTREESELECTOR
      
        module Converter

          def convert_fields
            self.description = convert_char_description
            self
          end

          def convert_char_description
            description.rstrip
          end

        end
      end
    end
  end
end
 
