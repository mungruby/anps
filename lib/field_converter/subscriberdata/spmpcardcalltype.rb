
module FieldConverter
 
  module SubscriberData  
 
    module SPMPCARDCALLTYPE

      def convert_fields
        self.calledpty_begin = convert_binary_calledpty_begin
        self.calledpty_end = convert_binary_calledpty_end
        self
      end

      def convert_binary_calledpty_begin
        calledpty_begin.delete '{}f'
      end

      def convert_binary_calledpty_end
        calledpty_end.delete '{}f'
      end

    end
  end
end
 
