
module FieldConverter
 
  module CallProcessing
 
    module NPANXX

      def convert_fields
        self.npa_nxx = convert_char_npa_nxx
        self.description = convert_char_description
        self
      end

      def convert_char_npa_nxx
        npa_nxx.rstrip
      end

      def convert_char_description
        description.rstrip
      end

    end
  end
end
 
