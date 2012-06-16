
module Alcatel
  module MMAppConfigData 
    module Resource
      module CFGIMSIGLOBALTITLE

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/Mobile-Global-Title-or-Allowed-Roaming-Number;"
          end

          def cd
            "cd #{e212imsistr}-#{e214gttstr}-#{nwknodeid}-CFGIMSIGLOBALTITLE;"
          end

          def query
            "query #{e212imsistr}-#{e214gttstr}-#{nwknodeid}-CFGIMSIGLOBALTITLE;"
          end

          def add
            cli =  "add CFGIMSIGLOBALTITLE E212_IMSI_Prefix=#{e212imsistr}, "
            cli << "E214_GTT_Prefix=#{e214gttstr}, "
            cli << "Network_Node=#{nwknodeid}, "
            cli << "Active=#{activeflag};"
          end

          def mod
            "mod "
          end

          def del
            "del #{e212imsistr}-#{e214gttstr}-#{nwknodeid}-CFGIMSIGLOBALTITLE;"
          end

        end
      end
    end
  end
end
 
