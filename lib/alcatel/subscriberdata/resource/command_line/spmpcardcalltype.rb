
module Alcatel
  module SubscriberData  
    module Resource
      module SPMPCARDCALLTYPE
        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/MSRN-HON-Distribution;"
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
            "mod "
          end

          def del
            "del #{calledpty_begin}-#{calledpty_end}-SPMPCARDCALLTYPE;"
          end

        end
      end
    end
  end
end
 
