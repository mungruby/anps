
module Alcatel
  module CallProcessing
    module Resource
      module HPLMODBMAP

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/ODB-Config"
            cli << "/PLMN-ODB-Mapping;"
          end

          def cd
            "cd #{plmnodbid}-HPLMODBMAP;"
          end

          def query
            "query #{plmnodbid}-HPLMODBMAP;"
          end

          def add
            "add HPLMODBMAP PLMN_ODB_ID=#{plmnodbid}, Service_Key=#{servicekey};"
          end

          def mod
            "mod "
          end

          def del
            "del #{plmnodbid}-HPLMODBMAP;"
          end

        end
      end
    end
  end
end
 
