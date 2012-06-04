
module FieldConverter
 
  module SubscriberData  
 
    module SPMPCARDCALLTYPE

      def convert_fields
        convert_binary_calledpty_begin
        convert_binary_calledpty_end
      end

      def convert_binary_calledpty_begin
        self.calledpty_begin = self.calledpty_begin.delete '{}f'
      end

      def convert_binary_calledpty_end
          self.calledpty_end = self.calledpty_end.delete '{}f'
      end

    end
  end
end
 
