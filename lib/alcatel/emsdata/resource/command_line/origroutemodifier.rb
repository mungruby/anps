
module Alcatel
  module EmsData
    module Resource
      module ORIGROUTEMODIFIER

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Routing"
            cli << "/Orig-Routing"
            cli << "/Orig-Route-Modifier;"
          end

          def cd
            "cd #{origroutingmodifier}-ORIGROUTEMODIFIER;"
          end

          def query
            "query #{origroutingmodifier}-ORIGROUTEMODIFIER;"
          end

          def add
            "add ORIGROUTEMODIFIER Profile_Identifier=#{origroutingmodifier}, Name=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{origroutingmodifier}-ORIGROUTEMODIFIER;"
          end

        end
      end
    end
  end
end
 
