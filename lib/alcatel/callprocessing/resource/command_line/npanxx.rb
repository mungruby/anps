
module Alcatel
  module CallProcessing
    module Resource
      module NPANXX 

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Network-Parameters"
            cli << "/LATAs"
            cli << "/#{latanumber}-LATA;"
          end

          def cd
            "cd #{npa_nxx}-NPANXX;"
          end

          def query
            "query #{npa_nxx}-NPANXX;"
          end

          def add
            "add NPANXX NPA_NXX_X=#{npa_nxx}, Description=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{npa_nxx}-NPANXX;"
          end

        end
      end
    end
  end
end
 
