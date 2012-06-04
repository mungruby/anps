
module CLI
 
  module SubscriberData  
 
    module SPMPCARDCALLTYPE

      def self.cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/MSRN-HON-Distribution;"
      end

      def cd
        "cd #{calledpty_begin}-#{calledpty_end}-SPMPCARDCALLTYPE;"
      end

      def query
        "query #{calledpty_begin}-#{calledpty_end}-SPMPCARDCALLTYPE;"
      end

      def add
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
        "del #{calledpty_begin}-#{calledpty_end}-SPMPCARDCALLTYPE;"
      end

    end
  end
end
 
