
module Alcatel
  module MMAppConfigData
    module Resource
      module MSCCFGNEIGHBHOOD

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/Neighborhood-MSC-or-VLR;"
          end

          def cd
            "cd #{mcc}-#{mnc}-#{lac}-MSCCFGNEIGHBHOOD;"
          end

          def query
            "query #{mcc}-#{mnc}-#{lac}-MSCCFGNEIGHBHOOD;"
          end

          def add
            cli =  "add MSCCFGNEIGHBHOOD Mobile_Country_Code=#{mcc}, "
            cli << "Mobile_Network_Code=#{mnc}, "
            cli << "Location_Area_Code=#{lac}, "
            cli << "MSC_ID=#{mscid}, "
            cli << "VLR_ID=#{vlrid}, "
            cli << "Description=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{mcc}-#{mnc}-#{lac}-MSCCFGNEIGHBHOOD;"
          end

        end
      end
    end
  end
end
 
