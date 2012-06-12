
module Alcatel
  module MMAppConfigData
    module Resource
      module MSCNETWORKNODE

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/Network-Nodes;"
          end

          def cd
            "cd #{nodeid}-MSCNETWORKNODE;"
          end

          def query
            "query #{nodeid}-MSCNETWORKNODE;"
          end

          #
          #  Add MSCNETWORKNODE Node_ID=<value>,
          #  Node_Type_1=<value>,
          #  Local=<value>,
          #  Standard=<value>,
          #  Routing_Choice=<value>,
          #  Network_ID=<value>,
          #  CAMEL_Ph1=<value>,
          #  CAMEL_Ph2=<value>,
          #  CAMEL_Ph3=<value>,
          #  Point_Code=<value>,
          #  Intl_Fmt_Addr__E_164=<value>,
          #  Description=<value>
          #  [,MAP_Version=<value>]
          #  [, GTT_Coding_Format=<value>]
          #  [, Nature_of_Address=<value>]
          #  [, Digit_Translation_Type=<value>]
          #
          def add
            cli =  "add MSCNETWORKNODE Node_ID=#{nodeid}, "
            cli << "Node_Type_1=#{nodetype}, "
            cli << "Local=#{}, "
            cli << "Standard=#{}, "
            cli << "Routing_Choice=#{routingchoice}, "
            cli << "Network_ID=#{networkid}, "
            cli << "CAMEL_Ph1=#{camelphases}, "
            cli << "CAMEL_Ph2=#{camelphases}, "
            cli << "CAMEL_Ph3=#{camelphases}, "
            cli << "Point_Code=#{pointcode}, "
            cli << "Intl_Fmt_Addr__E_164=#{address}, "
            cli << "MAP_Version=#{version}, "
            cli << "GTT_Coding_Format=#{format}, "
            cli << "Nature_of_Address=#{noa}, "
            cli << "Digit_Translation_Type=#{xlationtype}, "
            cli << "Description=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{nodeid}-MSCNETWORKNODE;"
          end

        end
      end
    end
  end
end
 
