
module FieldConverter
 
  module MMAppConfigData 
 
    module MCCMNC

      def convert_fields
        self.mcc = convert_binary_mcc
        self.mnc = convert_binary_mnc
        self.description = convert_char_description
        self
      end

      def convert_binary_mcc
        mcc.match(/{.([0-9a-f]).([0-9a-f]).([0-9a-f])}/).to_a.drop(1).join.delete('f')
      end

      def convert_binary_mnc
        mnc.match(/{.([0-9a-f]).([0-9a-f]).([0-9a-f])}/).to_a.drop(1).join.delete('f')
      end

      def convert_char_description
        description.rstrip
      end

    end
  end
end
 
