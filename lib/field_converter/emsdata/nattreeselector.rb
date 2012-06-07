
module FieldConverter
 
  module EmsData
 
    module NATTREESELECTOR

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
 
