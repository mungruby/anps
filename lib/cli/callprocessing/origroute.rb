
module CLI
 
  module CallProcessing  
 
    module ORIGROUTE

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation/Routing/Orig-Routing/Orig-Route;"
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
        "cd #{origroutingmodifier}-#{routeindex}-ORIGROUTE;mod "
      end

      def del
        "del #{origroutingmodifier}-#{routeindex}-ORIGROUTE;"
      end

    end
  end
end
 
