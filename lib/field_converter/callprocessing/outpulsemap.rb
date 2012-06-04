
module FieldConverter
 
  module CallProcessing
 
    module OUTPULSEMAP

      def convert_fields
        self.digitpattern = convert_char_digitpattern
        self.leadingdigitsadd = convert_char_leadingdigitsadd
        self.description = convert_char_description
        self.cpc = convert_tinyint_cpc
        self.cpc_priority = convert_tinyint_cpc_priority
      end

      def convert_char_digitpattern
        self.digitpattern.rstrip
      end

      def convert_char_leadingdigitsadd
        self.leadingdigitsadd.rstrip
      end

      def convert_char_description
        self.description.rstrip
      end

      def convert_tinyint_cpc
        case self.cpc
          when 0 then 'Unknown'
          when 255 then 'Do Not Overwrite'
          else raise "Unexpected value: CPC_Override=#{self.cpc}"
        end
      end

      def convert_tinyint_cpc_priority
        case self.cpc_priority
          when 0 then 'Unknown'
          when 255 then 'Do Not Overwrite'
          else raise "Unexpected value: CPC_Priority=#{self.cpc_priority}"
        end
      end

    end
  end
end
 
