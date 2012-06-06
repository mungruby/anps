
module FieldConverter
 
  module SubscriberData  
 
    module SPMMSISDNHLR

      def convert_fields
        self.msisdn_begin = convert_binary_msisdn_begin
        self.msisdn_end = convert_binary_msisdn_end
      end

      def convert_binary_msisdn_begin
        msisdn_begin.delete '{}f'
      end

      def convert_binary_msisdn_end
        msisdn_end.delete '{}f'
      end

    end
  end
end
 
