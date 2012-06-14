
module Alcatel
  module SubscriberData  
    module Resource
      module SPMMSISDNHLR
        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/MSISDN-To-HLR;"
          end

          def cd
            "cd #{msisdn_begin}-#{msisdn_end}-SPMMSISDNHLR;"
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
            "mod "
          end

          def del
            "del #{msisdn_begin}-#{msisdn_end}-SPMMSISDNHLR;"
          end

        end
      end
    end
  end
end
 
