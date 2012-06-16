
module Alcatel
  module CallProcessing
    module Resource
      module LRNLIST

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Network-Parameters"
            cli << "/1-LRNLISTKEY;"
          end

          def cd
            "cd #{lrn}-LRNLIST;"
          end

          def query
            "query #{lrn}-LRNLIST;"
          end

          def add
            "add LRNLIST LRN=#{lrn}, HLR_Number=#{hlr_num};"
          end

          def mod
            "mod "
          end

          def del
            "del #{lrn}-LRNLIST;"
          end

        end
      end
    end
  end
end
 
