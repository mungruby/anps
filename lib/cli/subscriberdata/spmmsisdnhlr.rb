
module CLI
 
  module SubscriberData  
 
    module SPMMSISDNHLR

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation/MSISDN-To-HLR;"
      end

      def query
        "query #{msisdn_begin}-#{msisdn_end}-SPMMSISDNHLR;"
      end

      def add
        cli =  "add SPMMSISDNHLR "
        cli << "MSISDN_Begin=#{msisdn_begin}, "
        cli << "MSISDN_End=#{msisdn_end}, "
        cli << "HLR_Number=#{hlr_num};"
      end

      def mod
        cli = "mod SPMMSISDNHLR "
      end

      def del
        "del #{msisdn_begin}-#{msisdn_end}-SPMMSISDNHLR;"
      end

    end
  end
end
 
