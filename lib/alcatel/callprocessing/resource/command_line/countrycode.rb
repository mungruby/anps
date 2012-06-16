
module Alcatel
  module CallProcessing
    module Resource
      module COUNTRYCODE

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Wireless-Translation"
            cli << "/International-Translation;"
          end

          def cd
            "cd #{countrycode}-COUNTRYCODE;"
          end

          def query
            "query #{countrycode}-COUNTRYCODE;"
          end

          def add
            cli =  "add COUNTRYCODE Country_Code=#{countrycode}, "
            cli << "Min__Length=#{minlength}, "
            cli << "Max__Length=#{maxlength}, "
            cli << "Orig__Route_Descriptor=#{routeindex}, "
            cli << "Name=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{countrycode}-COUNTRYCODE;"
          end

        end
      end
    end
  end
end
 
