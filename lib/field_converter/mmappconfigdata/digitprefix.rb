
module FieldConverter
 
  module MMAppConfigData 
 
    module DIGITPREFIX     

      def convert_fields
        self.digitprefix = convert_char_digitprefix
        self.description = convert_char_description
        self
      end

      def convert_char_digitprefix
        digitprefix.rstrip
      end

      def convert_char_description
        description.rstrip
      end

    end
  end
end
 
