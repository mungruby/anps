
module FieldConverter
 
  module CallProcessing
 
    module TRUNKGROUPBUNDLE

      def convert_fields
        self.bundledesc = convert_char_bundledesc
      end

      def convert_char_bundledesc
        self.bundledesc.rstrip
      end

    end
  end
end
 
