
module FieldConverter
 
  module CallProcessing
 
    module MSCROUTELIST

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
 
