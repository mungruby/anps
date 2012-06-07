
module FieldConverter
 
  module EmsData
 
    module DIGITDESCRIPTOR

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
 
