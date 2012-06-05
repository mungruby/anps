
module FieldConverter
 
  module MMAppConfigData 
 
    module COUNTRYINFO     

      def convert_fields
        self.country_name = convert_char_country_name
      end

      def convert_char_country_name
        self.country_name.rstrip
      end

    end
  end
end
 