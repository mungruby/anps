
module FieldConverter
 
  module MMAppConfigData 
 
    module MCCMNC

      def convert_fields
        self.mcc = convert_binary_mcc
        self.mnc = convert_binary_mnc
        self.description = convert_char_description
      end

      def convert_binary_mcc
        idx = 0
        digits = []
        self.mcc.slice(1..6).each_char do |ch|
          digits << ch unless idx % 2 == 0
          idx += 1
        end
        digits.join.delete 'f'
      end

      def convert_binary_mnc
        idx = 0
        digits = []
        self.mnc.slice(1..6).each_char do |ch|
          digits << ch unless idx % 2 == 0
          idx += 1
        end
        digits.join.delete 'f'
      end

      def convert_char_description
        self.description.rstrip
      end

    end
  end
end
 
