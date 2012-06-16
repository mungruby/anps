
module Alcatel
  module CallProcessing
    module Resource
      module LNPLIST

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Network-Parameters"
            cli << "/1-LNPLISTKEY;"
          end

          def cd
            "cd #{digitpattern}-LNPLIST;"
          end

          def query
            "query #{digitpattern}-LNPLIST;"
          end

          def add
            "add LNPLIST MSISDN_Pattern__with_CC=#{digitpattern}, LNP_Order=#{lnporder};"
          end

          def mod
            "mod "
          end

          def del
            "del #{digitpattern}-LNPLIST;"
          end

        end
      end
    end
  end
end
 
