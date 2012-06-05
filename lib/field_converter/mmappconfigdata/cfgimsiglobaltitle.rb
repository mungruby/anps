
module FieldConverter
 
  module MMAppConfigData 
 
    module CFGIMSIGLOBALTITLE

      def convert_fields
        self.e212imsistr = convert_char_e212imsistr
        self.e214gttstr = convert_char_e214gttstr
      end

      def convert_char_e212imsistr
        self.e212imsistr.rstrip
      end

      def convert_char_e214gttstr
        self.e214gttstr.rstrip
      end

    end
  end
end
 
