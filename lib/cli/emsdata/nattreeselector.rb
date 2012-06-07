
module CLI
 
  module EmsData
 
    module NATTREESELECTOR

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation" +
          "/Wireless-Translation/National-Tree-Selector;"
      end

      def query
        "query #{nattreeselector}-NATTREESELECTOR;"
      end

      def add
        cli =  "add NATTREESELECTOR National_Tree_Selector_Identifier=#{nattreeselector}, "
        cli << "Name=#{description};"
      end

      def mod
        cli =  "cd #{nattreeselector}-NATTREESELECTOR;\n"
        cli << "mod NATTREESELECTOR "
      end

      def del
        "del #{nattreeselector}-NATTREESELECTOR;"
      end

    end
  end
end
 
