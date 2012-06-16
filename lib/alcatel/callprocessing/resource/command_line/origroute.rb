
module Alcatel
  module CallProcessing
    module Resource
      module ORIGROUTE

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Routing"
            cli << "/Orig-Routing"
            cli << "/Orig-Route;"
          end

          def cd
            "cd #{origroutingmodifier}-#{routeindex}-ORIGROUTE;"
          end

          def query
            "query #{origroutingmodifier}-#{routeindex}-ORIGROUTE;"
          end

          def add
            cli =  "add ORIGROUTE OrigRoute_Descriptor=#{routeindex}, "
            cli << "Orig_Route_Modifier=#{origroutingmodifier}, "
            cli << "Route_Action=#{routeactiontype}, "
            cli << "Route_Index=#{routeaction}, "
            cli << "Ama_Index=#{amatranslationindex};"
          end

          def mod
            "mod Route_Action=#{routeactiontype}, Route_Index=#{routeaction};"
          end

          def del
            "del #{origroutingmodifier}-#{routeindex}-ORIGROUTE;"
          end

        end
      end
    end
  end
end
 
