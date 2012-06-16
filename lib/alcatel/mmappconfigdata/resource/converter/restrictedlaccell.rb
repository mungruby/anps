
module Alcatel
  module MMAppConfigData 
    module Resource
      module RESTRICTEDLACCELL

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
 
