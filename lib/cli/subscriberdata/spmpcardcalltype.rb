
module CLI
 
  module SubscriberData  
 
    module SPMPCARDCALLTYPE

      def self.cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/MSRN-HON-Distribution;"
      end

      def cd
        # field conversions
        calledpty_begin = convert_binary_calledpty_begin
        calledpty_end = convert_binary_calledpty_end

        "cd #{calledpty_begin}-#{calledpty_end}-SPMPCARDCALLTYPE;"
      end

      def query
        # field conversions
        calledpty_begin = convert_binary_calledpty_begin
        calledpty_end = convert_binary_calledpty_end

        "query #{calledpty_begin}-#{calledpty_end}-SPMPCARDCALLTYPE;"
      end

      def add
        # field conversions
        calledpty_begin = convert_binary_calledpty_begin
        calledpty_end = convert_binary_calledpty_end

        cli =  "add SPMPCARDCALLTYPE "
        cli << "Called_Pty_Begin=#{calledpty_begin}, "
        cli << "Called_Pty_End=#{calledpty_end}, "
        cli << "Pool_ID=#{pcardnum}, "
        cli << "Numbering_Type=#{calltype};"
      end

      def mod
        cli =  "mod SPMPCARDCALLTYPE "
      end

      def del
        # field conversions
        calledpty_begin = convert_binary_calledpty_begin
        calledpty_end = convert_binary_calledpty_end

        "del #{calledpty_begin}-#{calledpty_end}-SPMPCARDCALLTYPE;"
      end

      #
      # field conversions
      #

      def convert_binary_calledpty_begin
        self.calledpty_begin.delete "{}f"
      end

      def convert_binary_calledpty_end
        self.calledpty_end.delete "{}f"
      end

    end
  end
end
 
