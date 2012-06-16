
module Alcatel
  module CallProcessing
    module Resource
      module SERVICECRITERIA

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/ODB-Config"
            cli << "/Service-Criteria;"
          end

          def cd
            "cd #{servicekey}-SERVICECRITERIA;"
          end

          def query
            "query #{servicekey}-SERVICECRITERIA;"
          end

          def add
            cli =  "add SERVICECRITERIA Service_Key=#{servicekey}, "
            cli << "Criteria=#{handlingcriteria}, "
            cli << "Description=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{servicekey}-SERVICECRITERIA;"
          end

        end
      end
    end
  end
end
 
