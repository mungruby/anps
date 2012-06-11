
module CLI
 
  module EmsData
 
    module NATTREESELECTOR

      def context
        cli =  "cd; cd Office-Parameters"
        cli << "/Routing-and-Translation"
        cli << "/Wireless-Translation"
        cli << "/National-Tree-Selector;"
      end

      def cd
        "cd #{nattreeselector}-NATTREESELECTOR;"
      end

      def query
        "query #{nattreeselector}-NATTREESELECTOR;"
      end

      def add
        "add NATTREESELECTOR National_Tree_Selector_Identifier=#{nattreeselector}, Name=#{description};"
      end

      def mod
        cli = "mod "
      end

      def del
        "del #{nattreeselector}-NATTREESELECTOR;"
      end

    end
  end
end
 
