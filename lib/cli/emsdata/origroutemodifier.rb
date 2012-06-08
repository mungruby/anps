
module CLI
 
  module EmsData
 
    module ORIGROUTEMODIFIER

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation" +
          "/Routing/Orig-Routing/Orig-Route-Modifier;"
      end

      def query
        "query #{origroutingmodifier}-ORIGROUTEMODIFIER;"
      end

      def add
        "add ORIGROUTEMODIFIER Profile_Identifier=#{origroutingmodifier}, Name=#{description};"
      end

      def mod
        cli =  "cd #{origroutingmodifier}-ORIGROUTEMODIFIER;\n"
        cli << "mod ORIGROUTEMODIFIER "
      end

      def del
        "del #{origroutingmodifier}-ORIGROUTEMODIFIER;"
      end

    end
  end
end
 
