
module FieldConverter
 
  module MMAppConfigData 
 
    module DIGITPREFIX     

      def convert_fields
        self.digitprefix = convert_char_digitprefix
        self.description = convert_char_description
      end

      def convert_char_digitprefix
        self.digitprefix.rstrip
      end

      def convert_char_description
        self.description.rstrip
      end

    end
  end
end
 
