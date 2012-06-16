
module Alcatel
  module MMAppConfigData 
    module Resource
      module DIGITPREFIX  

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/Digit-Prefix;"
          end

          def cd
            "cd #{digitprefix}-DIGITPREFIX;"
          end

          def query
            "query #{digitprefix}-DIGITPREFIX;"
          end

          def add
            cli =  "add DIGITPREFIX Digit_Prefix=#{digitprefix}, "
            cli << "Country_Region_ID=#{country_id}, "
            cli << "Description=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{digitprefix}-DIGITPREFIX;"
          end

        end
      end
    end
  end
end
 
