
module FieldConverter
 
  module CallProcessing
 
    module COUNTRYCODE

      def convert_fields
        self.countrycode = convert_char_countrycode
        self.description = convert_char_description
      end

      def convert_char_countrycode
        self.countrycode.rstrip
      end

      def convert_char_description
        self.description.rstrip
      end

    end
  end
end
 
