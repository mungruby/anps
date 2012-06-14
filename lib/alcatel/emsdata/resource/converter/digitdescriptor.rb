
module Alcatel
  module EmsData
    module Resource
      module DIGITDESCRIPTOR
        module Converter

          def convert_fields
            self.descriptor = convert_char_descriptor
            self
          end

          def convert_char_descriptor
            descriptor.rstrip
          end

        end
      end
    end
  end
end
 
