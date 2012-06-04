
module FieldConverter
 
  module MMAppConfigData 
 
    module RESTRICTEDLACCELL

      def convert_fields
        convert_char_description
      end

      def convert_char_description
        self.description = self.description.rstrip
      end

    end
  end
end
 
