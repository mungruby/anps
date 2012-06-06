
module FieldConverter
 
  module CallProcessing
 
    module LRNLIST

      def convert_fields
        self.lrn = convert_char_lrn
        self
      end

      def convert_char_lrn
        lrn.rstrip
      end

    end
  end
end
 
